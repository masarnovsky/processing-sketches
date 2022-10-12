String source = "../sources/mona.jpg";
PImage img = null;
int min = 15;
int max = 0;
int middle = 0;
int current = 0;

void setup() {
  size(100, 100);
  img = loadImage(source);

  surface.setResizable(true);
  surface.setSize(img.width, img.height);
  surface.setLocation(50,50);

  middle = img.height/2;
  max = middle - min;
}

void draw() {
  img.loadPixels();

  for (int x = 0; x < img.width; x++) {
    current = int(random(min, max));
    int from = middle - current;
    int to = middle + current;

    color[] colors = new color[current*2];
    for (int y = from, i = 0; y < to; y++, i++) {
      int ind = x + (y * img.width);
      colors[i] = img.pixels[ind];
    }

    sortColors(colors);

    for (int y = from, i = 0; y < to; y++, i++) {
      int ind = x + (y * img.width);
      img.pixels[ind] = colors[i];
    }
  }

  img.updatePixels();
  image(img, 0, 0);
  noLoop();
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

void keyPressed() {
  if (key == 's') {
    saveFrame("frames/partial-pixel-sorting-" + int(random(500)) + ".png");
  }
}
