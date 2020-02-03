void setup() {
size(700,700);
smooth();
background(255);
noStroke();
}

void draw() {
  float r = random(255);
  float g = random(255);
  float b = random(255);
  float t = random(255);

  float rad = random(25);

  float x = random(width);
  float y = random(height);

  fill(r,g,b,t);
  ellipse(x, y, r, r);
}

void keyPressed() {
  if (key == 's') {
    saveFrame("random_generated_circles-######.png");
  }
}
