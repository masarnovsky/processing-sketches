ArrayList<Ball> balls = new ArrayList();

void setup() {
  size(500,500);
  noStroke();
}

void draw() {
  background(255);
  if (mousePressed == true) {
    balls.add(new Ball());
  }
  for (int i = 0; i < balls.size(); i++) {
    Ball b = balls.get(i);
    if (b.deleted) {
      balls.remove(i);
    }
    b.update();
    b.draw();
  }
}

class Ball {
  PVector location;
  PVector velocity;
  int d;
  int transparency = 255;
  int r = (int)random(255);
  int g = (int)random(255);
  int b = (int)random(255);
  boolean deleted = false;
  
  Ball() {
    location = new PVector(mouseX, mouseY);
    velocity = new PVector(random(-10,10), random(-10,10));
    d = (int) random(16, 40);
  }
  
  void update() {
    location.add(velocity);
    if (location.x > width || location.x < 0 || location.y > height || location.y < 0) {
      velocity.mult(-1);
    }
    transparency -= 3;
    if (transparency < 0) 
      deleted = true;
  }
  
  void draw() {
    fill(r,g,b,transparency);
    ellipse(location.x, location.y, d, d);
  }
}
