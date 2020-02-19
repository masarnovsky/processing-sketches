void setup() {
  size(700, 700);
  background(0);

  colorMode(HSB, 360, 100, 100);
  noStroke();

  int delta = 10;
  int rows = int(700/delta);

  for (int y = 0, i = 0; i <= rows; i++) {
    int hue = int(map(y, 0, height, 0, 360));
    fill(hue, 100, 100);

    rect(0, y, width, y + delta);
    y = y + delta;
  }
}
