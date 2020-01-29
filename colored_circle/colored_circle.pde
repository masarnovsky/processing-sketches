// case depends on mouse position

int x, y;
int r = 15;
int delta = r - 2;
int h,s,b,a;

void setup() {
  size(300, 300);
  background(0);
  x = 0;
  y = r/2;
  colorMode(HSB, 360, 100, 100, 100);
}

void draw() {
  noStroke();
  h = int(map(x, 0, width, 0, 360));
  s = int(map(y, 0, height, 0, 100));
  println(y);
  println(a);
  fill(h, s, 100, 100);
  ellipse(x,y,r,r);
  x++;
  checkXPosition();
}

void checkXPosition() {
  if (x >= width) {
    x = 0;
    y+=delta;
  }
}
