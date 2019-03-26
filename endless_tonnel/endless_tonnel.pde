final int SIZE = 600; 
final int REDUCER = 10;

SquareSet set = new SquareSet();

void setup() {
  size(600, 600);
  rectMode(CENTER);
  
}

void draw() {
  background(0);
  fill(0, 0);
  stroke(255);
  
  set.draw();
}

class Square {
  private int side;
  
  Square(int size) {
    this.side = size;
  }
  
  void reduce() {
    this.side -= REDUCER; //<>//
  }
  
  void setInitial() {
     this.side = SIZE;  //<>//
  } //<>//
  
  void draw() {
    rect(mouseX, mouseY, this.side, this.side);
  }
  
  boolean isFitted() {
    return this.side > 0 ? true : false;
  }
}

class SquareSet {
  int listSize;
  
  ArrayList<Square> squares;
  
  SquareSet() {
     listSize = 30; //<>//
     squares = new ArrayList();
     int initSize = SIZE;
     
     for (int i = 0; i < listSize; i++) {
       squares.add(new Square(initSize));
       initSize += 40;
     }
  }
  
  void draw() {
    for (Square s: squares) { //<>//
      s.draw();
      s.reduce();
      if (!s.isFitted()) {
        s.setInitial();
      }
    }
  }
}
