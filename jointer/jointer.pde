int size = 40;
int vel = 4;
int dotSize = 7;
int dist = 70;
Dot[] dots = new Dot[size];

void setup(){
  size(700, 700);
  smooth();

  colorMode(HSB, 360, 100, 100);
  fill(337, 91, 81);
  stroke(337, 91, 81);

  for (int i = 0; i < size; i++) {
    dots[i] = new Dot();
  }
}

void draw() {
  background(0);
  for (int i = 0; i < size; i++) {
    dots[i].update();
    dots[i].draw();

    for (int j = 0; j < size; j++) {
      if (i!=j) {
        checkDistanceAndDrawLine(dots[i], dots[j]);
      }
    }
  }
}

void checkDistanceAndDrawLine(Dot d1, Dot d2) {
  if (dist(d1.location.x, d1.location.y, d2.location.x, d2.location.y) < dist) {
    line(d1.location.x, d1.location.y, d2.location.x, d2.location.y);
  }
}

void keyPressed() {
 if (key == 's') {
   saveFrame("jointer-######.png");
 }
}
