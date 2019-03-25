ArrayList<Square> squares = new ArrayList();
int SIZE = 600;

void setup() {
  size(600, 600); //SIZE
  rectMode(CENTER);
}

void draw() {
  background(0);
  fill(0);
  stroke(255);
  for (Square s: squares) {
    s.draw();
    s.reduce();
    if (!s.isFitted()) {
      s.a = SIZE*2;
    }
  }
}

void mousePressed() {
   if (squares.size() < 1) {
       squares.add(new Square(SIZE*2));
   }
}

class Square {
  int a;
  
  Square(int size) {
    this.a = size;
  }
  
  void reduce() {
    this.a -= 10;
  }
  
  void draw() {
    rect(mouseX, mouseY, this.a/2, this.a/2);
  }
  
  boolean isFitted() {
    return this.a + 10 > 0 ? true : false;
  }
}
