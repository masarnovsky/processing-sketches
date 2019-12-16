PFont f;
ArrayList<Key> keys;
int fontSize = 300;


void setup() {
  fullScreen(1);
  //size(800, 800);
  f=createFont("Comic Sans MS", fontSize, true);
  textFont(f);
  keys = new ArrayList();
}

void draw() {
  background(#FF5254);
  for (Key k: keys) {
    k.display();
    k.fall();
  }

  clearFallenKeys();
}

void clearFallenKeys() {
  for (int i = keys.size() -1; i >= 0 ; i-- ) {
    if (keys.get(i).isFallen()) {
      keys.remove(i);
    }
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

  boolean isFallen() {
    return location.y > height + fontSize - 100;
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
