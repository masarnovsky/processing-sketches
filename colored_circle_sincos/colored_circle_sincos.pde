// color: 150, 190, 222, 244, 255, 273
import java.util.LinkedList;

float angle = 0;
int maxSize = 100;
LinkedList<Float> floats = new LinkedList();

void setup() {
  size(700, 700);
  colorMode(HSB, 360, 100, 100);
  noFill();
}

void draw() {
  background(0);
  if (floats.size() > maxSize) {
    floats.removeFirst();
  }
  if (frameCount%3 == 0) {
    floats.addLast((float) frameCount);
  }

  translate(width/2, height/2);
  for (int i = 0; i < floats.size(); i++) {
    int hue = int(map(i, 0, floats.size(), 150, 280));
    int brightness = int(map(i, 0, floats.size(), 5, 100));
    stroke(hue, 100, brightness);
    drawLine(floats.get(i));
  }

  angle += 3;
}

void drawLine(float t) {
  int a = 130;
  int b = 180;
  int c = 35;

  line(
    sin(t/a)*b+cos(t/c)*c,
    cos(t/a)*b + sin(t/c)*c,
    atan(t/a)*b+sin(t/c)*c,
    cos(t/a)*b+cos(t/c)*c
    );
}
