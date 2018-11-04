PFont f;
ArrayList<Key> keys;


void setup() {
  fullScreen(1);
  //size(800, 800);
  f=createFont("Comic Sans MS", 300, true);
  textFont(f);
  keys = new ArrayList();
}

void draw() {
  background(#FF5254);
  for (Key k: keys) {
    k.display();
    k.fall();
  }
}

void keyPressed() {
  keys.add(new Key());
}

class Key {
  PVector location, velocity;
  char k;
  color c;
  
  public Key() {
    this.c = 0;
    this.k = key;
    this.location = new PVector(random(width), random(height));
    this.velocity = new PVector(0, (int) random(1, 11));
  }
  
  void display() {
    fill(c);
    text(k, location.x, location.y);
  }
  
  void fall() {
    this.location.add(velocity);
    
    if (this.location.y - textAscent() > height) {
      ArrayList<Key> currentKeys = new ArrayList(keys);
      currentKeys.remove(this);
      keys = currentKeys;
    }
  }
}
