class Dot {
  PVector location;
  PVector velocity;

  Dot() {
    location = new PVector(random(width), random(height));
    velocity = new PVector(random(-vel,vel), random(-vel,vel));
  }

  void update() {
    location.add(velocity);
    if (location.x > width) {
      location.x = 0;
    }
    if (location.x < 0) {
      location.x = width;
    }
    if (location.y > height) {
      location.y = 0;
    }
    if (location.y < 0) {
      location.y = height;
    }
  }

  void draw() {
    ellipse(location.x, location.y, dotSize, dotSize);
  }
}
