float stepX;
float stepY;

void setup() {
  size(800,400);

  noStroke();
  colorMode(HSB, width, height, 100);
}

void draw() {

  stepX = mouseX + 2;
  stepY = mouseY + 2;


  for (float gridY = 0; gridY < height; gridY += stepY) {
    for (float gridX = 0; gridX < width; gridX += stepX) {
      fill(gridX, height - gridY, 100);
      rect(gridX, gridY, stepX, stepY);
    }
  }
}
