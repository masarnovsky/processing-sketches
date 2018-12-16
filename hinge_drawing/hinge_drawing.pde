// to add ability to create points by mouse (start and end point)
// create an UI (move by circle | or specific angle, etc)
// ability to move for draw point

//==============================================

ArrayList<PVector> points = new ArrayList();
ArrayList<Line> lines = new ArrayList();
Mode mode;

void setup() {
  size(600,600);
}

void mousePressed() {
  if (lines.size() <= 2) {
    lines.add(new Line(new PVector(mouseX, mouseY)));
  }
}

void takeScreenshot() {
  background(255);
  drawPoints();
  save(random(0, 9999999) + "screenshot.png");
}

void startNew() {
  points.clear();
  lines.clear();
}

void keyPressed() {
  if (key == 's') {
    takeScreenshot();
  } else if (key == 'r') {
    startNew();
  }
}


void draw() {
   background(255);
   
   if (lines.size() >= 2) {
     Line line1 = lines.get(0);
     Line line2 = lines.get(1);
     
     line1.update();
     line2.update();
     
     DrawingLine drawingLine = new DrawingLine(line1, line2);
     points.add(drawingLine.getDrawPoint());
     
     line1.draw();
     line2.draw();
     
     drawingLine.draw();
     drawPoints();
   }
}

void drawPoints() {
  for (PVector p: points) {
    ellipse(p.x, p.y, 2, 2);
  }
}
