// https://generativeartistry.com/tutorials/un-deux-trois/
int step = 40;

void setup() {
  size(900, 900);

  colorMode(HSB, 360, 100, 100);
  background(360);
  strokeWeight(5);
  noFill();

  drawLines(0, 300, false, false);
  drawLines(320, 600, true, false);
  drawLines(600, 900, true, true);
}

void drawLines(int startY, int endY, boolean second, boolean third) {
  for (int i = 0; i <= 900; i += step) {
    for (int j = startY; j < endY; j += step) {

      float h = map(j, 0, 900, 330, 10);
      float s = random(10, 90);
      float br = random(10, 90);
      stroke(h, s, br);

      PVector a, b;
      a = new PVector(i + step / 2, j);
      b = new PVector(i + step / 2, j + step);

      pushMatrix();
      translate((a.x + b.x) * 0.5, (a.y + b.y) * 0.5);
      rotate(radians(random(360)));
      translate(-(a.x + b.x) * 0.5, -(a.y + b.y) * 0.5);
      if (!second && !third) line(a.x, a.y, b.x, b.y);
      else if (second && ! third) {
        line(a.x-10, a.y, b.x-10, b.y);
        line(a.x+10, a.y, b.x+10, b.y);
      } else {
        line(a.x, a.y, b.x, b.y);
        line(a.x-13, a.y, b.x-13, b.y);
        line(a.x+13, a.y, b.x+13, b.y);
      }
      popMatrix();
    }
  }
}

void draw() {
}

void keyPressed() {
  if (key == 's') {
    saveFrame("un-deux-trois-######.png");
  }
}
