color[] colorsLeft;
color[] colorsRight;

int prevMouseX = -1;
int prevMouseY = -1;

void setup() {
  size(800, 800);
  colorMode(HSB, 360, 100, 100);
}

void draw() {
  int tileCountX = int(map(mouseX, 0, width, 2, 40));
  int tileCountY = int(map(mouseY, 0, height, 2, 10));

  float tileWidth = width/tileCountX;
  float tileHeight = height/tileCountY;

  if (isMousePositionWasChanged()) {
    generateColors(tileCountY);
  }

  for (int gridY = 0; gridY < tileCountY; gridY++) {
    color col1 = colorsLeft[gridY];
    color col2 = colorsRight[gridY];

    for (int gridX = 0; gridX < tileCountX; gridX++) {
      float amount = map(gridX, 0, tileCountX - 1, 0, 1);
      color interColor = lerpColor(col1, col2, amount);

      fill(interColor);

      float posX = tileWidth * gridX;
      float posY = tileHeight * gridY;

      rect(posX, posY, tileWidth, tileHeight);
    }
  }

  prevMouseX = mouseX;
  prevMouseY = mouseY;
}

void generateColors(int count) {
  colorsLeft = new color[count];
  colorsRight = new color[count];
  for (int i = 0; i < count; i++) {
    colorsLeft[i] = generateRandomColor();
    colorsRight[i] = generateRandomColor();
  }
}

color generateRandomColor() {
  float H = random(360);
  float S = random(100);
  float B = 100;
  return color(H, S, B);
}

boolean isMousePositionWasChanged() {
  return (prevMouseX!=mouseX) && (prevMouseY!=mouseY);
}
