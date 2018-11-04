final int max = 5;
int[] x = new int[max];
int[] y = new int[max];
int count = 0;


void setup() {
  size(600,600);
  background(255);
  smooth();
  stroke(0);
}

void draw() {
  if (count == max) {
    background(255);
    stroke(0);
    noFill();
    beginShape();
    curveVertex(x[0], y[0]);
    for (int i = 0; i < max; i++) {
      curveVertex(x[i], y[i]);
    }
    curveVertex(x[max-1], y[max-1]);
    endShape();
    count = 0;
  }
  for (int i = 0; i < count; i++) {
    fill(255, 0, 0);
    noStroke();
    ellipse(x[i], y[i], 3, 3);
  }
}

void mousePressed() {
  if (count == 0) {
    background(255);
  }
  x[count] = mouseX;
  y[count] = mouseY;
  count++;
}
