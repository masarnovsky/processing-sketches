String source = "../sources/unknown_pleasures.jpg";
int pixelSize = 16;
PImage img = null;

void setup() {
  size(100, 100);
  img = loadImage(source);

  surface.setResizable(true);
  surface.setSize(img.width * 2, img.height);
  surface.setLocation(50,50);
}

void draw() {
  image(img, 0, 0);

  img.loadPixels();
  for (int y = 0; y < img.height - pixelSize; y += pixelSize) {
    for (int x = 0; x < img.width - pixelSize; x += pixelSize) {
      setupNewColorForPixel(img.pixels, x, y);
    }
  }
  img.updatePixels();
  image(img, img.width, 0);

  noLoop();
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

void keyPressed() {
  if (key == 's') {
    saveFrame("frames/pixelation-" + int(random(500)) + ".png");
  }
}
