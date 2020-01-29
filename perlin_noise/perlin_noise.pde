float inc = 0.2;
float scl = 15;
float cols, rows;
float zoff = 0;
int particlesCount = 350;
int colsXrows;
boolean traced = false;
boolean blacked = false;

Particle[] particles;
PVector flowField[];

void setup() {
  size(400, 400);
  background(255);
  cols = floor(width / scl);
  rows = floor(height / scl);
  colsXrows = (int) (cols * rows);
  flowField = new PVector[colsXrows];
  particles = new Particle[particlesCount];
  for (int i = 0; i < particles.length; i++) {
    particles[i] = new Particle();
  }
}

void draw() {
  if (!traced) {
    background(255);
  }
  float yoff = 0;

  for (int y = 0 ; y < rows; y++) {
    float xoff = 0;
    for (int x = 0; x < cols; x++) {
      int index = (int) (x + y * cols);
      float angle =  noise(xoff, yoff, zoff) * TWO_PI;
      PVector v = PVector.fromAngle(angle);
      // drawVector(v, x, y);
      v.setMag(0.3);
      flowField[index] = v;
      xoff += inc;
    }
    yoff += inc;

    zoff += 0.009;
  }

  for (int i = 0; i < particles.length; i++) {
    particles[i].update();
    particles[i].edges();
    particles[i].show(blacked);
    particles[i].follow(flowField);
  }

}

void keyPressed() {
  if (key == 't') {
    if (traced) traced = false;
    else traced = true;
  }

  if (key == 's') {
    saveFrame("perlin-noise-######.png");
  }

  if (key == 'b') {
    if (blacked) { blacked = false;} else { blacked = true;}
  }
}

void drawVector(PVector v, int x, int y) {
  stroke(0, 100);
  pushMatrix();
  translate(x* scl,y*scl);
  rotate(v.heading());
  strokeWeight(1);
  line(0, 0, scl, 0);
  popMatrix();
}
