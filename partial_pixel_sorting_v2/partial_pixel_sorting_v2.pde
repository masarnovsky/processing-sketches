String source = "../sources/mona.jpg";
PImage img = null;
int length = 200;

void setup() {
  size(100, 100);
  img = loadImage(source);

  surface.setResizable(true);
  surface.setSize(img.width, img.height);
  surface.setLocation(50,50);
}

void draw() {
  img = loadImage(source);
  img.loadPixels();

  for (int x = 0; x <= img.width - length; x+=length) {
    for (int y = 0; y <= img.height - length; y+=length) {
      sortInArea(x, x + length, y, y + length);
    }
  }

  img.updatePixels();
  image(img, 0, 0);
  noLoop();
  println("end");
}

void sortInArea(int xStart, int xEnd, int yStart, int yEnd) {
  if (isSortByXAxis()) {
    sortByXInArea(xStart, xEnd, yStart, yEnd);
  } else {
    sortByYInArea(xStart, xEnd, yStart, yEnd);
  }
}

void sortByXInArea(int xStart, int xEnd, int yStart, int yEnd) {
  for (int y = yStart; y < yEnd; y++) {
    color[] colors = new color[xEnd-xStart];
    for (int x = xStart, indNew = 0; x < xEnd; x++, indNew++) {
      int indPix = x + (y * img.width);
      colors[indNew] = img.pixels[indPix];
    }
    sortColors(colors);
    updateXPixels(colors, y, xStart, xEnd);
  }
}

void sortByYInArea(int xStart, int xEnd, int yStart, int yEnd) {
  for (int x = xStart; x < xEnd; x++) {
    color[] colors = new color[yEnd-yStart];
    for (int y = yStart, indNew = 0; y < yEnd; y++, indNew++) {
      int indPix = x + (y * img.width);
      colors[indNew] = img.pixels[indPix];
    }
    sortColors(colors);
    updateYPixels(colors, x, yStart, yEnd);
  }
}

void updateYPixels(color[] sortedYColors, int x, int yStart, int yEnd) {
  for (int y = yStart, i = 0; y < yEnd; y++, i++) {
    int ind = x + (y * img.width);
    img.pixels[ind] = sortedYColors[i];
  }
}

void updateXPixels(color[] sortedYColors, int y, int xStart, int xEnd) {
  for (int x = xStart, i = 0; x < xEnd; x++, i++) {
    int ind = x + (y * img.width);
    img.pixels[ind] = sortedYColors[i];
  }
}

void sortColors(color[] colors) {
  quicksort(colors, 0, colors.length-1);
}

void quicksort(color colors[], int begin, int end) {
    if (begin < end) {
        int partitionIndex = partition(colors, begin, end);

        quicksort(colors, begin, partitionIndex-1);
        quicksort(colors, partitionIndex+1, end);
    }
}

int partition(color colors[], int begin, int end) {
    color pivot = colors[end];
    int i = (begin-1);

    for (int j = begin; j < end; j++) {
        if (brightness(colors[j]) >= brightness(pivot)) {
            i++;

            color swapTemp = colors[i];
            colors[i] = colors[j];
            colors[j] = swapTemp;
        }
    }

    color swapTemp = colors[i+1];
    colors[i+1] = colors[end];
    colors[end] = swapTemp;

    return i+1;
}

boolean isSortByXAxis() {
  return random(1) < 0.5;
}

void keyPressed() {
  if (key == 's') {
    saveFrame("result/partial-pixel-sorting-v2-" + int(random(500)) + ".png");
  }
  if (key == 'r') {
    loop();
  }
}
