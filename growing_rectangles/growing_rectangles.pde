ArrayList<Square> list = new ArrayList();

void setup() {
  size(700, 700, P2D);
}

void mousePressed() {
 list.add(new Square());
}

void draw() {
  setGradient();
  for (Square s: list) {
    s.draw();
  }
}

void keyPressed() {
  if (key == 's') {
    saveFrame("groving_rectangles-######.png");
  }
}

void setGradient() {
  noFill();
  color white = color(255);
  color grey = color(200);
  for (int i = 0; i <= 0 + width; i++) {
    float inter = map(i, 0, 0 + width, 0, 1);
    color c = lerpColor(white, grey, inter);
    stroke(c);
    line(0, i, 0 + width, i);
  }
}


class Square {
  PShape shape;
  float transparency;
  float x, y, h, w, lineWeight, initLineWeight;
  color c;

  float inc = 0.7;
  int minLineWeight = 25;


  Square() {
    h = random(300, 500);
    w = random(300, 500);

    x = mouseX;
    y = mouseY;

    initLineWeight = random(minLineWeight, 90);
    lineWeight = initLineWeight;
    c = color(random(255), random(255), random(255), random(30, 200));
    shape = createShape(RECT, x/2, y/2, w, h);
    shape.setStroke(c);
    shape.setStrokeWeight(initLineWeight);
    shape.setFill(0);
  }

  void updateShape() {
     lineWeight += inc;

     if ((lineWeight > initLineWeight * 2) || (lineWeight < initLineWeight / 2) || (lineWeight < 5)) {
       inc *= -1;
     }

     shape.setStrokeWeight(lineWeight);
  }

  void draw() {
   updateShape();
   shape(shape);
  }
}
