// https://coolors.co/01295f-437f97-849324-ffb30f-fd151b
// https://coolors.co/006ba6-0496ff-ffbc42-d81159-8f2d56
// https://coolors.co/d7d9b1-84acce-827191-7d1d3f-512500

float a = 180;
float a2 = 0;
float delta = 0.3;
int arcsCount = 17;
Arc[] arcs;

int framesToSave = 200;

void setup() {
  size(800, 800);
  colorMode(HSB, 360, 100, 100);
  background(0);
  smooth();
  noFill();

  arcs = new Arc[arcsCount];
  generateArcs();
}

void generateArcs() {
  color[] colors = getColorPalette();

  for (int i = 0, currentRadius = 150, prevStrokeWeight = 0; i < arcsCount; i++) {
    int newStrokeWeight = int(random(5, 20));
    int newRadius = currentRadius + newStrokeWeight + prevStrokeWeight;
    arcs[i] = new Arc(newRadius, colors[int(random(colors.length))], newStrokeWeight);

    currentRadius = newRadius;
    prevStrokeWeight = newStrokeWeight;
  }
}

void draw() {
  background(0);
  for (int i = 0; i < arcs.length; i++) {
    arcs[i].drawFigure();
  }

  // saveFrames();
}

void saveFrames() {
  if (framesToSave-- > 0) {
    saveFrame("out/###.png");
  }
}

void keyPressed() {
  if (key == 'r') {
    generateArcs();
  }
}

color[] getColorPalette() {
  color c1, c2, c3, c4, c5;
  int rand = int(random(3));

  if (rand == 0) {
    c1 = color(214, 99, 37);
    c2 = color(197, 56, 59);
    c3 = color(68, 76, 58);
    c4 = color(41, 94, 100);
    c5 = color(358, 92, 99);
  } else if (rand == 1) {
    c1 = color(201, 100, 65);
    c2 = color(205, 98, 100);
    c3 = color(39, 74, 100);
    c4 = color(338, 92, 85);
    c5 = color(335, 69, 56);
  } else {
    c1 = color(63, 18, 85);
    c2 = color(208, 36, 81);
    c3 = color(272, 22, 57);
    c4 = color(339, 77, 49);
    c5 = color(27, 100, 32);
  }

  color[] colors = {c1, c2, c3, c4, c5};

  return colors;
}
