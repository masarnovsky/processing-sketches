int size = 15;
float delta = 0;
float offset = 0;

void setup() {
  colorMode(HSB, 360, 100, 100, 100);
  noStroke();
  size(1200, 600);
}

void draw() {
  experiment5();
}

void experiment5() {
  // size  = 15;
  background(0);

  for (int i = 0; i < size; i++) {
    fill(map(i, 0, size, 0, 360), 100, 100, 50);
    float x = map(i, 0, size, 200, width - 200);
    float y = map(cos(delta + i / 2.5), -1, 1, 150, height - 150);
    delta += .002;

    // radius
    float sn = sin(offset +  i * 0.2);
    if (sn < 0) sn *= -1;
    float r = map(sn, 0, 1, 10, 250);

    offset += 0.001;
    ellipse(x, y, r, r);
  }
}

void experiment4() {
  // size  = 10;
  background(0);

  for (int i = 0; i < size; i++) {
    fill(map(i, 0, size, 0, 360), 100, 100, 50);
    float x = map(i, 0, size, 200, width - 200);
    float y = map(cos(delta + i / 2.5), -1, 1, 150, height - 150);

    float sn = map(sin(i + offset), 0, size, -1, 1);
    if (sn < 0) sn *= -1;
    float initSize = map(sn, 0, 1, 10, 250);
    float r = initSize;
    delta += .001;
    offset += 0.01;
    ellipse(x, y, r, r);
  }
}

void experiment3() {
  // size  = 10;
  background(0);

  for (int i = 0; i < size; i++) {
    fill(map(i, 0, size, 0, 360), 100, 100, 50);
    float x = map(i, 0, size, 200, width - 200);
    float y = map(cos(delta + i / 2.5), -1, 1, 150, height - 150);

    float r = delta;
    delta += .002;
    offset += 0.002;
    println(r);
    println(delta);
    ellipse(x, y, r, r);
  }
}

void experiment2() {
  // size = 10;
  background(0);

  for (int i = 0; i < size; i++) {
    fill(map(i, 0, size, 0, 360), 100, 100, 50);
    float x = map(i, 0, size, 150, width - 150);
    float y = map(cos(delta + i / 1.5), -1, 1, 150, height - 150);
    float r = map(noise(offset + i), 0, 1, 10, 250);
    delta += .003;
    offset += .001;
    ellipse(x, y, r, r);
  }
}

void experiment1() {
  // size = 20;
  background(0);

  for (int i = 0; i < size; i++) {
    fill(map(i, 0, size, 0, 360), 100, 100, 50);
    float x = map(i, 0, size, 150, width - 150);
    float y = height/2;
    float r = map(cos(i + delta), -1, 1, 10, 250);
    delta += .001;
    ellipse(x, y, r, r);
  }
}

void keyPressed() {
  if (key == 's') {
    saveFrame("sincosexperiments-######.png");
  }
}
