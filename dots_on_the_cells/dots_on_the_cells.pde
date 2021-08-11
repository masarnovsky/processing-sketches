int cellCount = 7;
int cellSize = 70;
int pointSize = cellSize;
int pointCount = (cellCount * cellCount) / 3;
int size = 800;
color[] colors;
color backgroundColor;
color cellColor;
ArrayList<PVector> points = new ArrayList();

void setup() {
  size(800, 800);
  setupColorPalette();

  pushMatrix();
  createBackgroundCells();
  createPoints();
  popMatrix();
}

void createBackgroundCells() {
  noFill();
  background(backgroundColor);
  stroke(cellColor);

  int translateValue = (size - cellCount * cellSize) / 2;
  translate(translateValue, translateValue);
  for (int i = 0; i <= cellCount; i++) {
    for (int j = 0; j <= cellCount; j++) {
      strokeWeight(1);
      int x = i*cellSize;
      int y = j*cellSize;
      points.add(new PVector(x, y));
      if (i < cellCount && j < cellCount) { // we need to add extra coordinates for PVector
        rect(x, y, cellSize, cellSize);
      }
    }
  }
}

void createPoints() {
    noStroke();

    trimPointsList();
    for (int i = 0; i < points.size(); i++) {
      PVector point = points.get(i);
      fill(getRandomColor());
      ellipse(point.x, point.y, pointSize, pointSize);
    }
}

void trimPointsList() {
  while(points.size() >= pointCount) {
    removeRandomPoint();
  }
}

void removeRandomPoint() {
  points.remove(int(random(points.size())));
}

void setupColorPalette() {
  colorMode(HSB, 360, 100, 100);
  smooth();

  backgroundColor = color(197, 3, 96);
  cellColor = color(218, 19, 68);

  color c1, c2, c3, c4, c5;
  c1 = color(201, 100, 65);
  c2 = color(205, 98, 100);
  c3 = color(39, 74, 100);
  c4 = color(338, 92, 85);
  c5 = color(335, 69, 56);
  colors = new color[]{c1, c2, c3, c4, c5};
}

color getRandomColor() {
  return colors[int(random(colors.length))];
}

void display() {}
