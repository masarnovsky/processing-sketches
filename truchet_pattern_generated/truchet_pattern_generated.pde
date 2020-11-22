int iSize = 100;


void setup() {
  size(600, 600);

  noLoop();
}

void draw() {
  background(255);
  // fill(0);
  smooth();
  stroke(0);
  rectMode(CENTER);
  drawNewPattern();
}

void keyPressed() {
 if (key == 'r') {
   redraw();
 }

 if (key == 's') {
   saveFrame("truchet-generated-######.png");
 }
}

void drawNewPattern() {
  for (int i = 0; i < 6; i++) {
    for (int j = 0; j< 6; j++) {
      // drawTriangle(i*iSize, j*iSize);
      // drawArc(i*iSize, j*iSize);
      drawLines(i*iSize, j*iSize);
    }
  }
}

void drawTriangle(int x, int y) {
  int ind = (int) random(4);
  switch(ind) {
    case 0: triangle(x, y, x + 100, y + 100, x, y + 100); break;
    case 1: triangle(x + 100, y, x + 100, y + 100, x, y); break;
    case 2: triangle(x + 100, y, x + 100, y + 100, x, y + 100); break;
    case 3: triangle(x, y, x + 100, y, x + 100, y + 100); break;
  }
}

void drawArc(int x, int y) {
  int ind = (int) random(2);
  switch(ind) {
    case 0:
      arc(x, y, 100, 100, 0, PI/2);
      arc(x, y, 100, 100, PI, 3 * PI / 2);
      break;
    case 1:
      arc(x, y, 100, 100, PI, 0);
      arc(x, y, 100, 100, PI/2, 3 * PI / 2);
      break;
  }
}

void drawLines(int x, int y) {
  int ind = (int) random(4);
  switch(ind) {
    case 0:
      line(x, y, x+50, y + 50);
      line(x, y + 100, x + 50, y + 50);
      break;
    case 1:
      line(x+100, y, x+50, y + 50);
      line(x+100, y + 100, x + 50, y + 50);
      break;
    case 2:
      line(x, y + 100, x+50, y + 50);
      line(x+100, y + 100, x + 50, y + 50);
      break;
    case 3:
      line(x, y, x+50, y + 50);
      line(x+100, y, x + 50, y + 50);
      break;
    }
}
