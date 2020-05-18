class Arc {
  int radius;
  color clr;

  float start;
  float end;
  float delta;
  float current;

  public Arc(int r, color c) {
    this.radius = r;
    clr = c;
    delta = random(0.1, 0.8);

    float val1 = random(0, 320);
    float val2 = random(val1 + 20, 360);
    start = val1;
    end = val2;
    if (int(random(2)) == 1) { // set initial direction
      current = start;
    } else {
      current = end;
      delta *= -1;
    }
  }

  public void draw() {
    stroke(clr);
    arc(width/2, height/2, radius, radius, radians(start), radians(current));
    if (current < start || current > end) {
      delta *= -1;
    }
    current += delta;
  }
}
