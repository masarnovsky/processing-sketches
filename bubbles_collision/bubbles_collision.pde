ArrayList<Ball> balls = new ArrayList();
int vel = 4;
int d = 55;
int ballsCount = 10;

int framesToSave = 200;
boolean recording = false;

void setup() {
  size(800,800);
  colorMode(HSB, 360, 100, 100);
  noStroke();

  for (int i = 0; i < ballsCount; i++) {
    balls.add(new Ball());
  }
}

void draw() {
  background(0);

  for (int k = 0; k < balls.size(); k++) {
    balls.get(k).setPaint(false);
  }

  for (int i = 0; i < balls.size(); i++) {
    for (int j = 0; j < balls.size(); j++) {
      if (i != j) {
        Ball ballI = balls.get(i);;
        Ball ballJ = balls.get(j);

        if (dist(ballI.getX(), ballI.getY(), ballJ.getX(), ballJ.getY()) <= d) {
          ballI.setPaint(true);
          ballJ.setPaint(true);
        }
      }
    }
  }

  for (int k = 0; k < balls.size(); k++) {
    Ball ball = balls.get(k);
    ball.update();
    ball.draw();
  }

  // saveFrames();
}

void saveFrames() {
  if (framesToSave-- > 0) {
    saveFrame("out/###.png");
  }
}

class Ball {
  PVector location;
  PVector velocity;
  boolean paint = false;
  int h;
  int s;
  int b;

  Ball() {
    location = new PVector(random(d*1.2, width - d*1.2 ), random(d*1.2, height - d*1.2));
    velocity = new PVector(random(-vel,vel), random(-vel,vel));
    resetColor();
  }

  boolean isPaint() {
    return paint;
  }

  void setPaint(boolean paint) {
    this.paint = paint;
  }

  float getX() {
    return location.x;
  }

  float getY() {
    return location.y;
  }

  void update() {
    location.add(velocity);
    if (location.x + d/2 >= width || location.x - d/2 <= 0) {
      velocity.x *= -1;
    }
    if (location.y + d/2 >= height || location.y - d/2 <= 0) {
      velocity.y *= -1;
    }
  }

  void draw() {
    if (paint) {
      fill(125);
    } else {
      fill(h, s, b);
    }
    ellipse(location.x, location.y, d, d);
  }

  void resetColor() {
    this.h = (int)random(25, 345);
    this.s = (int)random(25, 85);
    this.b = (int)random(25, 85);
  }
}

void keyPressed() {
  if (key == 's') {
    recording = true;
  }

  if (key == 'r') {
    for (int k = 0; k < balls.size(); k++) {
      balls.get(k).resetColor();
    }
  }
}
