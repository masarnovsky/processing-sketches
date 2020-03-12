String source = "../sources/mona_2.jpg";
int source1Width = 357;
int source1Height = 500;
int d = 2;

void setup() {
  size(256, 256);
  PImage mona = loadImage(source);

  PImage pixelated = createImage(358, 500, RGB);

  mona.loadPixels();
  for (int y = 0; y < height; y += d) {
    for (int x = 0; x < width; x += d) {
        int x1 = x + y * width;
        int x2 = x1 + 1;
        int x3 = x + ((y+1) * width);
        int x4 = x3 + 1;

          color c1 = mona.pixels[x1];
          color c2 = mona.pixels[x2];
          color c3 = mona.pixels[x3];
          color c4 = mona.pixels[x4];

          float r = calculateAvg(red(c1), red(c2), red(c3), red(c4));
          float g = calculateAvg(green(c1), green(c2), green(c3), green(c4));
          float b = calculateAvg(blue(c1), blue(c2), blue(c3), blue(c4));

          color col = color(r,g,b);
          mona.pixels[x1] = col;
          mona.pixels[x2] = col;
          mona.pixels[x3] = col;
          mona.pixels[x4] = col;
    }
  }
  mona.updatePixels();
  image(mona, 0, 0);
}

float calculateAvg(float c1, float c2, float c3, float c4) {
    return (c1 + c2+c3+c4) / 4;
}

void draw() {
  //
}
