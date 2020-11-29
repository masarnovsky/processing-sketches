class Dot {
  PVector location;
  PVector velocity;
  boolean isLinear = true;

  float xoff = 0;
  float yoff = 100000;
  float delta = 0.1;
  int mult;

  Dot(boolean isLinear) {
    this.isLinear = isLinear;
    location = new PVector(random(width), random(height));
    velocity = new PVector(random(-vel,vel), random(-vel,vel));

    xoff = (int) random(0, 5000);
    yoff = (int) random(10000, 1000000);
    mult = (int) random (-10, 10);
    while (mult == 0) {
      mult = (int) random (-10, 10);
    }
  }

  void setLinear(boolean isLinear) {
    this.isLinear = isLinear;
  }

  void update() {
    if (isLinear) {
      location.add(velocity);
    } else {
      location.x += noise(xoff) * mult;
      location.y += noise(yoff) * mult;
      xoff += delta;
      yoff += delta;
    }

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
