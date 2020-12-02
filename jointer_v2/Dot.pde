class Dot {
  PVector location;

  float xoff = 0;
  float yoff = 100000;
  float delta = 0.001;
  color c;

  Dot(color c) {
    location = new PVector(random(width), random(height));
    xoff = (int) random(0, 5000);
    yoff = (int) random(10000, 1000000);
    this.c = c;
  }

  void update() {
    location.x = map(noise(xoff), 0, 1, 0, width + 50);
    location.y = map(noise(yoff), 0, 1, 0, height + 50);
    xoff += delta;
    yoff += delta;

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
    strokeWeight(2);
    stroke(360);
    fill(c);
    ellipse(location.x, location.y, dotSize, dotSize);
  }
}
