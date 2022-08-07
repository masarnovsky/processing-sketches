class Arc {
  int radius;
  color clr;
  float start;
  float end;
  float delta;
  float current;
  int strokeWeight;
  boolean reversed = false;

  public Arc(int r, color c, int strokeWeight) {
    this.radius = r;
    this.clr = c;
    this.strokeWeight = strokeWeight;
    setUpDirection();
  }

  private void setUpDirection() {
    delta = random(0.1, 0.8);
    float val1 = random(0, 320);
    float val2 = random(val1 + 20, 360);
    start = val1;
    end = val2;
    Direction direction = randomDirection();

    switch(direction) {
      case FROM_START_TO_END: current = start; break;
      case FROM_END_TO_START: setUpFromEndToStartDirection(); break;
      case REVERSED_FROM_START_TO_END: setUpReversedFromStartToEndDirection(); break;
      case REVERSED_FROM_END_TO_START: setUpReversedFromEndToStartDirection(); break;
    }
  }

  private void setUpFromEndToStartDirection() {
    current = end;
    delta *= -1;
  }

  private void setUpReversedFromEndToStartDirection() {
    current = start;
    start = end;
    end = current;
    reversed = true;
  }

  private void setUpReversedFromStartToEndDirection() {
    reversed = true;
    current = end;
    end = start;
    start = current;
    delta *= -1;
  }

  private Direction randomDirection() {
    int pick = int(random(Direction.values().length));
    return Direction.values()[pick];
  }

  public void drawFigure() {
    stroke(clr);
    strokeWeight(strokeWeight);

    if (reversed) {
      arc(width/2, height/2, radius, radius, radians(current), radians(start));
      if (current - (2 * delta) > start || current < end) {
        delta *= -1;
      }
      current -= delta;
    } else {
      arc(width/2, height/2, radius, radius, radians(start), radians(current));
      if (current + (2 * delta) < start || current > end) {
        delta *= -1;
      }
      current += delta;
    }
  }
}
