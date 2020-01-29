int h,s,b,a;

void setup() {
  size(600,600);
  background(0);
  colorMode(HSB, 360, 100, 100, 100);
  noStroke();
}

void draw() {
  h = int(map(mouseX, 0, width, 0, 360));
  s = 100;
  b = int(map(mouseY, 0, height, 0, 100));
  a = 100;
  fill(h, s, b, a);
  ellipse(mouseX,mouseY,15,15);
}
