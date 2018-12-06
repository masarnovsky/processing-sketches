class Line {
  PVector pivot;
  PVector hinge;
  float radius;
  float theta;
  float thetaDelta;
  float radiusDelta;
  
  Line(PVector pivot) {
    this.pivot = pivot;
    this.hinge = new PVector();
    radius = random(10, 150);
    theta = radians(random(0, 360));
    thetaDelta = random(-0.1, 0.1);
    radiusDelta = random(-0.1, 0.1);
  }
  
  void update() {
    recalculateHinge();
    theta += thetaDelta;
    radius += radiusDelta;
  }
  
  PVector getPivot() {
    return pivot;
  }
  
  PVector getHinge() {
    return hinge;
  }
  
  float calculateHingePointX() {
    return radius * cos(theta);
  }
  
  float calculateHingePointY() {
    return radius * sin(theta);
  }
  
  void recalculateHinge() {
    hinge.x = calculateHingePointX() + pivot.x;
    hinge.y = calculateHingePointY() + pivot.y;
  }
  
  void draw() {
    strokeWeight(2);
    stroke(0);
    ellipse(pivot.x, pivot.y, 2, 2);
    ellipse(hinge.x, hinge.y, 2, 2);
    line(pivot.x, pivot.y, hinge.x, hinge.y);
  }
}
