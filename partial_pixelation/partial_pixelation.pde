String source = "../sources/mona.jpg";
int pixelSize = 5;
int minPixelSize = 2;
int maxPixelSize = 20;
boolean saveModeOn = false;

int pixelationSize = 100;
PImage img = null;
boolean isPartialPixelationOn = false;
Mode mode = Mode.ENDLESS;

void setup() {
  size(100, 100);
  img = loadImage(source);

  surface.setResizable(true);
  surface.setSize(img.width, img.height);
  surface.setLocation(50,50);
}

Pair<Pair<Integer, Integer>, Pair<Integer, Integer>> calculatePixelationArea() {
  Pair<Integer, Integer> leftUpperCorner = new Pair(mouseX - pixelationSize, mouseY - pixelationSize);
  Pair<Integer, Integer> rightBottomCorner = new Pair(mouseX + pixelationSize, mouseY + pixelationSize);
  return new Pair(leftUpperCorner, rightBottomCorner);
}

boolean isPixelationAreaOutOfBorders(Pair<Pair<Integer, Integer>, Pair<Integer, Integer>> area) {
  return area.left.left < 0 || area.left.right < 0 || area.right.left > img.width || area.right.right > img.height;
}

void draw() {
  Pair<Pair<Integer, Integer>, Pair<Integer, Integer>> area = calculatePixelationArea();
  if (isPartialPixelationOn) {
    if (mode == Mode.SINGLE) {
      img = loadImage(source);
    }
    img.loadPixels();

    if (isPixelationAreaOutOfBorders(area)) {
      adjustPixelationArea(area);
    }

    for (Integer y = area.left.right; y < area.right.right; y += pixelSize) {
      for (Integer x = area.left.left; x < area.right.left; x += pixelSize) {
        setupNewColorForPixel(img.pixels, x, y);
      }
    }
    img.updatePixels();
  }
  image(img, 0, 0);

  // drawPixelationAreaBorders();
  if (saveModeOn) {
    saveFrames();
  }
}

void adjustPixelationArea(Pair<Pair<Integer, Integer>, Pair<Integer, Integer>> area) {
    if (area.left.left < 0) {
      area.left.left = 0;
    }
    if (area.left.right < 0) {
      area.left.right = 0;
    }
    if (area.right.left > img.width) {
      area.right.left = img.width;
    }
    if (area.right.right > img.height) {
      area.right.right = img.height - pixelSize;
    }
}

void drawPixelationAreaBorders() {
  noFill();
  rect(mouseX - pixelationSize, mouseY - pixelationSize, pixelationSize * 2, pixelationSize * 2);
}

void setupNewColorForPixel(color[] pixels, int x, int y) {
  color[] rowsAvgColors = new color[pixelSize];
  float r = 0;
  float g = 0;
  float b = 0;

  for (int i = 0; i < pixelSize; i++) {
    int rowX = x + ((y + i) * img.width);
    color rowAvgColor = calculateAvgColorForRow(pixels, rowX);
    r += red(rowAvgColor);
    g += green(rowAvgColor);
    b += blue(rowAvgColor);
  }

  color commonColor = createCommonColor(r, g, b);

  for (int j = 0; j < pixelSize; j++) {
    int rowX = x + ((y + j) * img.width);
    setupPixelColor(pixels, rowX, commonColor);
  }
}

color calculateAvgColorForRow(color[] pixels, int rowX) {
  color[] colors = new color[pixelSize];
  float r = 0;
  float g = 0;
  float b = 0;
  for (int i = 0; i < pixelSize; i++) {
    color col = pixels[rowX + i];
    r += red(col);
    g += green(col);
    b += blue(col);
  }

  return createCommonColor(r, g, b);
}

color createCommonColor(float r, float g, float b) {
  return color(r / pixelSize, g / pixelSize, b / pixelSize);
}

void setupPixelColor(color[] pixels, int ind, color col) {
  for (int i = 0; i < pixelSize; i++) {
    pixels[ind + i] = col;
  }
}

void saveFrames() {
  saveFrame("frames/partial_pixelation-####.tif");
}

void keyPressed() {
  if (key == 's') {
    saveModeOn = !saveModeOn;
  }
  if (key == 't') {
    isPartialPixelationOn = !isPartialPixelationOn;
    if (mode == Mode.SINGLE) {
      img = loadImage(source);
    }
  }
  if (key == 'r') {
    img = loadImage(source);
  }
  if (key == 'm') {
    changeMode();
  }
  if (key == '+' && pixelSize < maxPixelSize) {
    pixelSize++;
  }
  if (key == '-' && pixelSize > minPixelSize) {
    pixelSize--;
  }
}

void changeMode() {
  if (mode == Mode.SINGLE) {
    mode = Mode.ENDLESS;
  } else {
    mode = Mode.SINGLE;
    img = loadImage(source);
  }
}

class Pair<T, K> {
  T left;
  K right;

  public Pair(T left, K right) {
    this.left = left;
    this.right = right;
  }
}

enum Mode {
  ENDLESS, SINGLE;
}
