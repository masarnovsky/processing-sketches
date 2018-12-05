// to add ability to create points by mouse (start and end point)
// class for drawing line (set drawing point, color, opacity etc.)
// create an UI (move by circle | or specific angle, etc)
// ability to move for draw point

//==============================================

ArrayList<PVector> points = new ArrayList();
ArrayList<Line> lines = new ArrayList();

void setup() {
  size(600,600);
}

void mousePressed() {
  if (lines.size() <= 2) {
    lines.add(new Line(new PVector(mouseX, mouseY)));
  }
}

void draw() {
   background(255);
   if (lines.size() >= 2) {
     Line line1 = lines.get(0);
     Line line2 = lines.get(1);
     line1.update();
     line1.draw();
     line2.update();
     line2.draw();
     
     stroke(255,0,0, 30);
     fill(255,0,0, 30);
     line(line1.hinge.x, line1.hinge.y, line2.hinge.x, line2.hinge.y);
     float centerX = (line1.hinge.x + line2.hinge.x)/2 ;
     float centerY = (line1.hinge.y + line2.hinge.y)/2;
     ellipse(centerX, centerY, 4,4);
     points.add(new PVector(centerX, centerY));
   
     for (PVector p: points) {
       //point(p.x, p.y);
       ellipse(p.x, p.y, 2, 2);
     }
   }
}
