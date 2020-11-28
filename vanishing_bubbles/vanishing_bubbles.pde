ArrayList<Ball> balls = new ArrayList();

void setup() {
  size(500,500);
  colorMode(HSB, 360, 100, 100);
  noStroke();
}

void draw() {
  background(360);
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
  int transparencyDelta = (int) random(1, 6);
  int r = (int)random(360);
  int g = (int)random(100);
  int b = (int)random(100);
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
    transparency -= transparencyDelta;
    if (transparency < 0)
      deleted = true;
  }

  void draw() {
    fill(r,g,b,transparency);
    ellipse(location.x, location.y, d, d);
  }
}

void keyPressed() {
  if (key == 's') {
    saveFrame("bubbles-######.png");
  }
}
