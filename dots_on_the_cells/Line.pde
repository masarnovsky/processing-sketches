class Line {
  PVector a;
  PVector b;

  @Override
  public boolean equals(Object obj) {
    if (this == obj) return true;

    if (obj instanceof Line) {
      Line other = (Line) obj;
      return (a.x == other.a.x) &&
      (a.y == other.a.y) &&
      (b.x == other.b.x) &&
      (b.y == other.b.y);
    }

    return false;
  }
}
