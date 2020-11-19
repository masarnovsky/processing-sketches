int iSize = 100;


void setup() {
  size(600, 600);

  noLoop();
}

void draw() {
  background(255);
  fill(0);
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
      drawTriangle(i*iSize, j*iSize);
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
