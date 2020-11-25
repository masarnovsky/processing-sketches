int iSize = 100;
color[] colors;

// create UI
void setup() {
  size(800, 800);

  colorMode(HSB, 360, 100, 100);
  smooth();
  rectMode(CENTER);

  initColorPalette();

  noLoop();
}

void draw() {
  background(0);

  for (int i = 0; i < width/iSize; i++) {
    for (int j = 0; j< height/iSize; j++) {
      // drawTriangle(i*iSize, j*iSize);
      drawArc(i*iSize, j*iSize);
      // drawLines(i*iSize, j*iSize);
    }
  }
}

void drawTriangle(int x, int y) {
  int ind = (int) random(4);
  color c = getColor();
  fill(c);
  stroke(c);
  switch(ind) {
    case 0: triangle(x, y, x + 100, y + 100, x, y + 100); break;
    case 1: triangle(x + 100, y, x + 100, y + 100, x, y); break;
    case 2: triangle(x + 100, y, x + 100, y + 100, x, y + 100); break;
    case 3: triangle(x, y, x + 100, y, x + 100, y + 100); break;
  }
}

void drawArc(int x, int y) {
  noFill();
  int ind = (int) random(2);

  color c = getColor();
  strokeWeight((int) random(1, 20));
  stroke(c);

  switch(ind) {
    case 0:
      arc(x, y, 100, 100, 0, PI/2);
      arc(x + 100, y + 100, 100, 100, PI, 3 * PI / 2);
      break;
    case 1:
      arc(x+100, y, 100, 100, PI/2, PI);
      arc(x, y + 100, 100, 100, 3 * PI / 2, TWO_PI);
      break;
  }
}

// * if line have a sibling - they have similar stroke weight
void drawLines(int x, int y) {
  int ind = (int) random(4);
  int strokeWeight = getStrokeWeight();
  color c = getColor();

  boolean isDuplicated = defineDuplicates();

  switch(ind) {
    case 0:
      drawLine1(x, y, isDuplicated, c, strokeWeight);
      break;
    case 1:
      drawLine2(x, y, isDuplicated, c, strokeWeight);
      break;
    case 2:
      drawLine3(x, y, isDuplicated, c, strokeWeight);
      break;
    case 3:
      drawLine4(x, y, isDuplicated, c, strokeWeight);
      break;
    }
}

void drawLine1(int x, int y, boolean isDuplicated, color c, int strokeWeight) {
  stroke(c);
  strokeWeight(strokeWeight);

  line(x, y, x+50, y + 50);
  line(x, y + 100, x + 50, y + 50);

  if (isDuplicated) {
    stroke(getColor());
    strokeWeight(getStrokeWeight());

    line(x+50, y, x+100, y + 50);
    line(x+50, y + 100, x + 100, y + 50);
  }
}

void drawLine2(int x, int y, boolean isDuplicated, color c, int strokeWeight) {
  stroke(c);
  strokeWeight(strokeWeight);

  line(x+100, y, x+50, y + 50);
  line(x+100, y + 100, x + 50, y + 50);

  if (isDuplicated) {
    stroke(getColor());
    strokeWeight(getStrokeWeight());

    line(x+50, y, x, y + 50);
    line(x+50, y + 100, x, y + 50);
  }
}

void drawLine3(int x, int y, boolean isDuplicated, color c, int strokeWeight) {
  stroke(c);
  strokeWeight(strokeWeight);

  line(x, y + 100, x+50, y + 50);
  line(x+100, y + 100, x + 50, y + 50);

  if (isDuplicated) {
    stroke(getColor());
    strokeWeight(getStrokeWeight());

    line(x, y + 50, x+50, y);
    line(x+100, y + 50, x + 50, y);
  }
}

void drawLine4(int x, int y, boolean isDuplicated, color c, int strokeWeight) {
  stroke(c);
  strokeWeight(strokeWeight);

  line(x, y, x+50, y + 50);
  line(x+100, y, x + 50, y + 50);

  if (isDuplicated) {
    stroke(getColor());
    strokeWeight(getStrokeWeight());

    line(x, y + 50, x+50, y + 100);
    line(x+100, y + 50, x + 50, y + 100);
  }
}


//____________ utils methods

void keyPressed() {
 if (key == 'r') {
   redraw();
 }

 if (key == 's') {
   saveFrame("truchet-generated-######.png");
 }
}

void initColorPalette() {
  color c1 = color(214, 99, 37);
  color c2 = color(197, 56, 59);
  color c3 = color(68, 76, 58);
  color c4 = color(41, 94, 100);
  color c5 = color(358, 92, 99);

  colors = new color[]{c1, c2, c3, c4, c5};
}

color getColor() {
  return colors[(int) random(5)];
}

void setRandomColor() {
  color c = getColor();
  stroke(c);
}

int getStrokeWeight() {
  return (int) random(2, 7);
}

void setRandomStrokeWeight() {
  int weight = getStrokeWeight();
  strokeWeight(weight);
}

boolean defineDuplicates() {
  return ((int) random(2)) == 1;
}
