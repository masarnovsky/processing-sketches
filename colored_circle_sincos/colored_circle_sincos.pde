// color: 150, 190, 222, 244, 255, 273
import java.util.LinkedList;


float angle = 0;
int maxSize = 100;
// LinkedList<PVector> list = new LinkedList();
LinkedList<Float> floats = new LinkedList();

void setup() {
  size(700, 700);
  colorMode(HSB, 360, 100, 100);
  noFill();
}

void draw() {
  background(0);

  // float x = width/2 + 300 * cos(radians(angle));
  // float y = height/2 + 300 * sin(radians(angle));
  // PVector current = new PVector(x, y);
  // addNewElement(current);

  if (floats.size() > maxSize) {
    floats.removeFirst();
  }
  if (frameCount%3 == 0) {
    floats.addLast((float) frameCount);
  }

translate(width/2, height/2);

  for (int i = 0; i < floats.size(); i++) {
    // PVector vec = list.get(i);
    int hue = int(map(i, 0, floats.size(), 150, 280));
    int brightness = int(map(i, 0, floats.size(), 5, 100));
    stroke(hue, 100, brightness);
    // ellipse(vec.x, vec.y, 40, 40);
    f(floats.get(i));
  }

  angle += 3;
}

// void addNewElement(PVector vec) {
//   if (list.size() > maxSize) {
//     list.removeFirst();
//   }
//   list.addLast(vec);
// }

void f(float t) {
  line(
    sin(t/140)*200+cos(t/30)*30,
    cos(t/140)*200 + sin(t/30)*30,
    atan(t/140)*200+sin(t/30)*39,
    cos(t/140)*200+cos(t/30)*30
    );


  // float t = (float) frameCount;
  // translate(width/2, height/2);
  // rotate(t/200);

  // reference
  // line(sin(t/140)*200+cos(t/30)*30, cos(t/140)*200 + sin(t/30)*30,
  //     atan(t/140)*200+sin(t/30)*39, cos(t/140)*200+cos(t/30)*30);
}
