int initStep = 40;
int lineHeight = 25;
int initBtw = 10;

void setup() {
  size(900, 900);

  background(255);
  stroke(0);
  strokeWeight(5);

  drawLines(0, 300, false, false);
  drawLines(300, 600, true, false);
  drawLines(600, 900, true, true);

  noLoop();
}

void drawLines(int startY, int endY, boolean second, boolean third) {
  int step = initStep;
  int btw = initBtw;

  if (third && second) {
    step = initStep - 15;
    btw = initBtw;
  } else if (!third && second) {
    step = initStep;
    btw = initBtw + 3;
  } else {
    step = initStep + 15;
    btw = initBtw;
  }

  for (int i = 0; i <= 900; i += step) {
    for (int j = startY; j < endY; j += step) {
      pushMatrix();
      translate(i, j);
      rotate(radians(random(360)));

      line(0, 0, 0, lineHeight);
      if (second) line(btw, 0, btw, lineHeight);
      if (third) line(2 * btw, 0, 2 * btw, lineHeight);

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
