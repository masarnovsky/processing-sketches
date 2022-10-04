void setup() {
  size(720,720);
  noCursor();

  colorMode(HSB, 360, 100, 100);
  rectMode(CENTER);
  noStroke();
}

void draw() {
  background(mouseY / 2, 100, 100);
  fill(360 - mouseX / 2, 100, 100);

  rect(360, 360, mouseX + 1, mouseX + 1);
}
