void setup() {
  size(900, 900);
  background(0);
  noFill();
  stroke(255);
  strokeWeight(4);

  int sum = 0;

  for (int i = 100; i <= 700; i +=100) {
    sum += i;
    for (int j = 100; j <= 700; j +=100) {
      sum += j;
      float seed = random(sum);
      float rotSeed = map(seed, 0, 22400, 0, PI/2);

      pushMatrix();

      translate(j, i);
      rotate(rotSeed);
      rect(0, 0, 100, 100);

      popMatrix();
    }
  }

  noLoop();
}

void draw() {
}

void keyPressed() {
  if (key == 's') {
    saveFrame("cubic-disarray-######.png");
  }
}
