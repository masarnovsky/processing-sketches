// color: 150, 190, 222, 244, 255, 273
float a = 0;
int r = 75;
int size = 12;

AnglePoint[] pp = new AnglePoint[size];

void setup() {
  size(500, 500);
  colorMode(HSB, 360, 100, 100);
  smooth();

  for (int i=0; i< size; i++, a += 0.4) {
    PVector point = new PVector();
    point.x = r * cos(a);
    point.y = r * sin(a);

    AnglePoint p = new AnglePoint(point, a);
    int hue = int(map(i, 0, size, 150, 280));
    int brightness = int(map(i, 0, size, 5, 100));
    p.c = color(hue, 100, brightness);

    pp[i] = p;
  }
}

void experiment0(AnglePoint p) {
  //template
}

void loadingIcon(AnglePoint p) {
  stroke(p.c);
  strokeWeight(4);

  PVector point = new PVector();
  point.x = (r-30) * cos(p.a);
  point.y = (r-30) * sin(p.a);
  line(p.X(), p.Y(), point.x,  point.y);
}

void experiment4(AnglePoint p) {
  rotate(p.a);

  fill(p.c);
  rect(p.X(), p.Y(), 3, 25);
}

void experiment1(AnglePoint p) {
  rotate(a);

  fill(p.c);
  rect(p.X(), p.Y(), 3, 25);
}

void experiment2(AnglePoint p) {
  stroke(p.c);
  // line(p.X(), p.Y(), p.X(), 30);
  line(p.X(), p.Y(), 30, 30);  //v2
}

void experiment3(AnglePoint p) {
  fill(p.c);
  rect(p.X(), p.Y(), 3, 25);
}

void draw() {
  translate(width/2, height/2);
  rotate(3*PI/2);
  background(0);

  for (int i=0; i< size; i++) {
    AnglePoint p = pp[i];
    PVector point = p.p;

    float newA = p.a + 0.03;
    p.a = newA;
    point.x = r * cos(newA);
    point.y = r * sin(newA);

    loadingIcon(p);

    // ellipse(p.X(), p.Y(), 20, 20);  // default
  }
}

class AnglePoint {
  PVector p;
  float a;
  color c;

  AnglePoint(PVector point, float angle) {
    p = point;
    a = angle;
  }

  float X() {
    return p.x;
  }

  float Y() {
    return p.y;
  }
}
