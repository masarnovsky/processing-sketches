int step = 40;

//which consists in a grid of randomly rotated lines where the number of rotated lines increases as the y-axis position increases.
void setup() {
  size(900, 900);

  background(255);
  stroke(0);
  strokeWeight(5);
  noFill();


  drawLines(0, 300, false, false);
  drawLines(320, 600, true, false);
  drawLines(600, 900, true, true);

  noLoop();
}

void drawLines(int startY, int endY, boolean second, boolean third) {
  for (int i = 0; i <= 900; i += step) {
    for (int j = startY; j < endY; j += step) {
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