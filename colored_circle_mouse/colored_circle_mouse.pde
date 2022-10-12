int h,s,b,a;
int r = 15;
int mX = -1, mY = -1;

int framesToSave = 360;

void setup() {
  size(800,800);
  background(0);
  colorMode(HSB, 360, 100, 100, 100);
  noStroke();
}

void draw() {
  h = int(map(mouseX, 0, width, 0, 360));
  s = 100;
  b = int(map(mouseY, 0, height, 0, 100));
  a = 100;
  fill(h, s, b, a);
  ellipse(mouseX,mouseY,r,r);
  changeRadius();
  mX = mouseX;
  mY = mouseY;

  saveFrames();
}

void saveFrames() {
  if (framesToSave-- > 0) {
    saveFrame("frames/###.png");
  }
}

void changeRadius() {
  if (mX != -1 || mY != -1) {
    int x = abs(mouseX - mX);
    int y = abs(mouseY - mY);
    int max = max(x, y);
    r = int(map(max, 0, 300, 3, 40));
  }
}

void keyPressed() {
  if (key == 's') {
    saveFrame("colored_circle-######.png");
  }
}
