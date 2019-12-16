Ball[] balls = new Ball[1];
static float gravity = 0.1;

void setup() {
  size(800, 600);
  smooth();
  frameRate(30);
  float n = random(2,16);
  balls[0] = new Ball(width/2, height/2, n/2, n);
}

void mousePressed() {
  float n = random(2,16);
  Ball b = new Ball(mouseX, mouseY, n/2, n);
  balls = (Ball[])append(balls, b);
}

void draw() {
  background(100);
  for (int i =0; i < balls.length; i++) {
    balls[i].gravity();
    balls[i].move();
    balls[i].display();
  }
}


class Ball {
  float x;
  float y;
  float speed;
  float w;

  Ball(int tX, int tY, float tSpeed, float tW) {
    x = tX;
    y = tY;
    speed = tSpeed;
    w = tW;
  }

  void gravity() {
    speed = speed + gravity;
  }

  void move() {
    y = y + speed;
    if (y > height) {
      speed = speed * -0.95;
      y = height;
    }
  }

  void display() {
    fill(255);
    noStroke();
    ellipse(x, y, w, w);
  }
}
