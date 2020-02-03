PImage tiles[];
int iSize = 100;

void setup() {
  size(600, 600);
  tiles = new PImage[4];
  tiles[0] = loadImage("tile.png");
  tiles[1] = loadImage("tile2.png");
  tiles[2]= loadImage("tile3.png");
  tiles[3] = loadImage("tile4.png");

  noLoop();
}

void draw() {
  drawNewPattern();
}

void keyPressed() {
 if (key == 'r') {
   redraw();
 }

 if (key == 's') {
   saveFrame("truchet-######.png");
 }
}

void drawNewPattern() {
  for (int i = 0; i < 6; i++) {
    for (int j = 0; j< 6; j++) {
      drawRandomTile(i*iSize, j*iSize);
    }
  }
}

void drawRandomTile(int x, int y) {
  int ind = (int) random(4);
  image(tiles[ind], x, y);
}
