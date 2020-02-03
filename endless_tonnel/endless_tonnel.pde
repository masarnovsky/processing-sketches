final int SIZE = 600;
final int REDUCER = 10;

ArrayList<SquareSet> squareSetList = new ArrayList();

void setup() {
  size(600, 600);
  rectMode(CENTER);
}

void mousePressed() {
  squareSetList.add(new SquareSet());
}

void draw() {
  background(0);
  fill(0, 0);

  for (SquareSet set: squareSetList) {
    set.draw();
  }
}

class Square {
  private int side;
  private float opacity;

  Square(int size, float opacity) {
    this.side = size;
    this.opacity = opacity;
  }

  void reduce() { //<>//
    this.side -= REDUCER; //<>//
  }

  void setInitial() {
     this.side = SIZE;  //<>//
  }

  void draw() {
    stroke(255, opacity);
    rect(mouseX, mouseY, this.side, this.side);
  }

  boolean isFitted() {
    return this.side > 0 ? true : false;
  }
}

class SquareSet {
  int listSize = 10;
  ArrayList<Square> squares;

  SquareSet() { //<>//
     squares = new ArrayList();
     int initSize = SIZE;
     int opacity = 255;

     for (int i = 0; i < listSize; i++) {
       squares.add(new Square(initSize, opacity));
       initSize += 40;
       opacity -= 30;
     }
  }

  void draw() {
    for (Square s: squares) { //<>//
     if (s.isFitted()) {
        s.draw();
        s.reduce();
      }
    }
  }
}

void keyPressed() {
  if (key == 's') {
    saveFrame("tonnel-######.png");
  }
}
