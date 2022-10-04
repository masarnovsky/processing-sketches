String source = "../sources/signac.jpg";
int pixel = 4;

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
  for (int y = 0; y < img.height - pixel; y += pixel) {
    for (int x = 0; x < img.width - pixel; x += pixel) {
        int x1 = x + y * img.width; // first row
        int x2 = x + ((y+1) * img.width); // second row
        int x3 = x + ((y+2) * img.width); // third row
        int x4 = x + ((y+3) * img.width); // fourth row

        color firstRowColor = calculateAvgForRow(img.pixels, x1);
        color secondRowColor = calculateAvgForRow(img.pixels, x2);
        color thirdRowColor = calculateAvgForRow(img.pixels, x3);
        color fourthRowColor = calculateAvgForRow(img.pixels, x4);

        float r = calculateAvg(red(firstRowColor), red(secondRowColor), red(thirdRowColor), red(fourthRowColor));
        float g = calculateAvg(green(firstRowColor), green(secondRowColor), green(thirdRowColor), green(fourthRowColor));
        float b = calculateAvg(blue(firstRowColor), blue(secondRowColor), blue(thirdRowColor), blue(fourthRowColor));
        color col = color(r,g,b);

        setUpColorForPixels(img.pixels, x1, col);
        setUpColorForPixels(img.pixels, x2, col);
        setUpColorForPixels(img.pixels, x3, col);
        setUpColorForPixels(img.pixels, x4, col);
    }
  }
  img.updatePixels();
  image(img, img.width, 0);

  noLoop();
}

void setUpColorForPixels(color[] pix, int ind, color c) {
  int i = ind;
  pix[i++] = c;
  pix[i++] = c;
  pix[i++] = c;
  pix[i++] = c;
}

color calculateAvgForRow(color[] pix, int ind) {
  color c1 = pix[ind];
  color c2 = pix[ind+1];
  color c3 = pix[ind+2];
  color c4 = pix[ind+3];

  float r = calculateAvg(red(c1), red(c2), red(c3), red(c4));
  float g = calculateAvg(green(c1), green(c2), green(c3), green(c4));
  float b = calculateAvg(blue(c1), blue(c2), blue(c3), blue(c4));

  color col = color(r,g,b);
  return col;
}

float calculateAvg(float c1, float c2, float c3, float c4) {
    return (c1 + c2 + c3 + c4) / 4;
}
