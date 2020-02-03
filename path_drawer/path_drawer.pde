ArrayList<PVector> list = new ArrayList();

void setup() {
  size(600,600);
  stroke(0);
  fill(0);
}

void mousePressed() {
  list.add(new PVector(mouseX, mouseY));
}

void draw() {
  background(255);

  if (list.size() > 0) {
    for (int i = 0; i < list.size(); i++) {
      PVector pv = list.get(i);
      ellipse(pv.x, pv.y, 2, 2);
      if (i + 1 >= list.size()) {
        ellipse(mouseX, mouseY, 2, 2);
        line(pv.x, pv.y, mouseX, mouseY);
      } else {
        PVector pv2 = list.get(i+1);
        line(pv.x, pv.y, pv2.x, pv2.y);
      }
    }
  }
}

void keyPressed() {
  if (key == 's') {
    saveFrame("tonnel-######.png");
  }
}
