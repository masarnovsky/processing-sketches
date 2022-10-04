float segmentCount = 24;
float radius = 400;

void setup() {
  size(800, 800);
  colorMode(HSB, 360, width, height);
  // noStroke();
}

void draw() {
  background(360, 0, 0);
  float angleStep = 360 / segmentCount;

  beginShape(TRIANGLE_FAN);
  vertex(width/2, height/2);

  for (float angle = 0; angle <= 360; angle += angleStep) {
    float vx = width/2 + cos(radians(angle)) * radius;
    float vy = height/2 + sin(radians(angle)) * radius;
    vertex(vx, vy);
    stroke(angle, mouseX, mouseY);
    fill(angle, mouseX, mouseY);
  }

  endShape();
}

void keyPressed() {
  switch(key) {
    case '1': segmentCount = 360; break;
    case '2': segmentCount = 45; break;
    case '3': segmentCount = 24; break;
    case '4': segmentCount = 12; break;
    case '5': segmentCount = 6; break;
  }
}
