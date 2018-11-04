ArrayList<Point> points = new ArrayList();

void setup() {
  size(800, 600);
}

void mousePressed() {
  if (points.size() < 10) {
    points.add(new Point(mouseX, mouseY));
  }
}

void keyPressed() {
  if (key == 'c') {
    points.clear();
  }
}

void drawAllLinesWithPsychodelicRandomColors() {
  for (int i = 0; i < points.size(); i++) {
    Point p1 = points.get(i);
    for (int j = 0; j < points.size(); j++) {
      Point p2 = points.get(j);
      
      stroke(random(255), random(255), random(255));
      line(p1.getX(), p1.getY(), p2.getX(), p2.getY());
    }
  }
}

void drawAllPoints() {
  for (Point p: points) {
    p.draw();
  }
}

void draw() {
  background(255);
  drawAllLinesWithPsychodelicRandomColors();
  drawAllPoints();
}

class Point {
  int x;
  int y;
  
  public void draw() {
    stroke(0);
    fill(0);
    ellipse(x, y, 5, 5);
  }
  
  Point(int x, int y) {
    this.x = x;
    this.y = y;
  }
  
  public int getX() {
    return x;
  }
  
  public int getY() {
    return y;
  }
}
