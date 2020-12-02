int size = 15;
int vel = 4;
int dotSize = 16;
int dist = 100;
Dot[] dots = new Dot[size];

int colorSize = 5;
color[] colors = new color[colorSize];

void setup(){
  size(700, 700);
  smooth();

  colorMode(HSB, 360, 100, 100, 100);
  generateColorPalette();

  for (int i = 0; i < size; i++) {
    dots[i] = new Dot(colors[(int) random(colorSize)]);
  }
}

void draw() {
  background(360);
  for (int i = 0; i < size; i++) {
    for (int j = 0; j < size; j++) {
      if (i!=j) {
        checkDistanceAndDrawLine(dots[i], dots[j]);
      }
    }
  }

  for (int k = 0; k < size; k++) {
    dots[k].update();
    dots[k].draw();
  }
}

void checkDistanceAndDrawLine(Dot d1, Dot d2) {
  int currentDistance = (int) PVector.dist(d1.location, d2.location);
  if (currentDistance < dist) {

    stroke(lerpColor(d1.c, d2.c, 2), map(currentDistance, 0, dist, 80, 0));
    strokeWeight(16);
    line(d1.location.x, d1.location.y, d2.location.x, d2.location.y);
  }
}

void generateColorPalette() {
  colors[0] = color(155, 62, 71);
  colors[1] = color(191, 49, 78);
  colors[2] = color(39, 76, 98);
  colors[3] = color(4, 58, 91);
  colors[4] = color(0, 22, 98);
}

void keyPressed() {
 if (key == 's') {
   saveFrame("jointer_v2-######.png");
 }
}
