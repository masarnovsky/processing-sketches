public class Particle {
  PVector pos;
  PVector vel;
  PVector acc;
  int maxSpeed = 2;
  color c;


  public Particle() {
    pos = new PVector(random(width), random(height));
    vel = new PVector(0, 0);
    acc = new PVector(0, 0);
    c = color(random(255),random(255), random(255), 100);
  }

  void update() {
    vel.add(acc);
    vel.limit(maxSpeed);
    pos.add(vel);
    acc.mult(0);
  }

  void addForce(PVector force) {
    acc.add(force);
  }

  void show(boolean blacked) {
    if (blacked) {
      fill(1);
      stroke(0);
      strokeWeight(1);
      } else { stroke(c); }
    // stroke(c);
    strokeWeight(3);
    point(pos.x, pos.y);
  }

  void edges() {
    if (pos.x > width) pos.x = 0;
    if (pos.x < 0) pos.x = width;
    if (pos.y > height) pos.y = 0;
    if (pos.y < 0) pos.y = height;
  }

  void follow(PVector[] vec) {
    float x = floor(pos.x / scl);
    float y = floor(pos.y / scl);

    int index = (int) (x + y * cols);
    if (index >= particlesCount) index = particlesCount - 1;
    PVector force = vec[index];

    this.addForce(force);

  }
}
