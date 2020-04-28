String source = "../sources/mona_3.jpg";
int d = 4;

void setup() {
  size(1600, 800);
  PImage mona = loadImage(source);
  image(mona, 0, 0);

  mona.loadPixels();
  for (int y = 0; y < mona.height - d; y += d) {
    for (int x = 0; x < mona.width - d; x += d) {
        int x1 = x + y * mona.width; // first row
        int x2 = x + ((y+1) * mona.width); // second row
        int x3 = x + ((y+2) * mona.width); // third row
        int x4 = x + ((y+3) * mona.width); // fourth row

        color firstRowColor = calculateAvgForRow(mona.pixels, x1);
        color secondRowColor = calculateAvgForRow(mona.pixels, x2);
        color thirdRowColor = calculateAvgForRow(mona.pixels, x3);
        color fourthRowColor = calculateAvgForRow(mona.pixels, x4);

        float r = calculateAvg(red(firstRowColor), red(secondRowColor), red(thirdRowColor), red(fourthRowColor));
        float g = calculateAvg(green(firstRowColor), green(secondRowColor), green(thirdRowColor), green(fourthRowColor));
        float b = calculateAvg(blue(firstRowColor), blue(secondRowColor), blue(thirdRowColor), blue(fourthRowColor));
        color col = color(r,g,b);

        setUpColorForPixels(mona.pixels, x1, col);
        setUpColorForPixels(mona.pixels, x2, col);
        setUpColorForPixels(mona.pixels, x3, col);
        setUpColorForPixels(mona.pixels, x4, col);
    }
  }
  mona.updatePixels();
  image(mona, 800, 0);
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
