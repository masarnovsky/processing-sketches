// color: 150, 190, 222, 244, 255, 273
import java.util.LinkedList;


float angle = 0;
int maxSize = 100;
LinkedList<PVector> list = new LinkedList();
LinkedList<Float> floats = new LinkedList();

void setup() {
  size(700, 700);
  colorMode(HSB, 360, 100, 100);
  noFill();
}

void draw() {
  background(0);

  float x = width/2 + 300 * cos(radians(angle));
  float y = height/2 + 300 * sin(radians(angle));
  PVector current = new PVector(x, y);
  addNewElement(current);

  for (int i = 0; i < list.size(); i++) {
    PVector vec = list.get(i);
    int hue = int(map(i, 0, list.size(), 150, 280));
    int brightness = int(map(i, 0, list.size(), 5, 100));
    stroke(hue, 100, brightness);
    ellipse(vec.x, vec.y, 40, 40);
  }

  angle += 1;
}

void addNewElement(PVector vec) {
  if (list.size() > maxSize) {
    list.removeFirst();
  }
  list.addLast(vec);
}
