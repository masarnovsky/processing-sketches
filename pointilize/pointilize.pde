String source = "mona.png"; // 357x500
int source1Width = 357;
int source1Height = 500;

String source2 = "signac.jpg";
int source2Width = 816;
int source2Height = 1045;

PImage img;
boolean toggled = false;
int defaulfSize = 16;
int pointilize = defaulfSize;
int h, w;

void setup() {
  size(357, 500);
  img = loadImage(source);
  h = source1Height;
  w = source1Width;
  background(0);
  noStroke();
  smooth();
}

void draw() {
  int x = int(random(w));
  int y = int(random(h));
  int loc = x + y * img.width;

  loadPixels();

  float r = red(img.pixels[loc]);
  float g = green(img.pixels[loc]);
  float b = blue(img.pixels[loc]);

  fill(r, g, b, 100);
  ellipse(x, y, pointilize, pointilize);
}

void keyPressed() {
  if (key == 'c') { // change size to random
    if (toggled) {
      pointilize = defaulfSize;
      toggled = false;
    } else {
      pointilize = (int) random(4, 30);
      toggled = true;
    }
  }

  if (key == 'e') {
    background(0);
  }

  if (key == 's') {
    saveFrame("pointilize-######.png");
  }
}
