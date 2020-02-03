int strokeWeight = 1;
int rad = 500;

void setup() {
  size(600, 600);
  noFill();
  background(200, 200, 200);

  for (int i = 0; i < 20; i++) {
      strokeWeight(strokeWeight);
      ellipse(width/2, height/2, rad, rad);
      rad -= 30;
      if (i > 1 && i%2==0 && i <= 8) {
        strokeWeight++;
      }
  }
}

void draw() {}

void keyPressed() {
  if (key == 's') {
    saveFrame("circle-######.png");
  }
}
