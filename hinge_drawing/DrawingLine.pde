class DrawingLine {
  PVector start;
  PVector end;
  PVector drawPoint = new PVector();
  color c;
  
  DrawingLine(Line start, Line end) {
    this.start = start.hinge;
    this.end = end.hinge;
    this.drawPoint.x = (start.hinge.x + end.hinge.x)/2;
    this.drawPoint.y = (start.hinge.y + end.hinge.y)/2;
    c = color(255, 0, 0, 30);
  }
  
  PVector getDrawPoint() {
    return drawPoint;
  }
  
  void draw() {
    stroke(c);
    fill(c);
    line(start.x, start.y, end.x, end.y);
    ellipse(drawPoint.x, drawPoint.y, 4, 4);
  }
}
