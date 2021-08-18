PFont f;
ArrayList<Key> keys;
int fontSize = 300;

int framesToSave = 200;
boolean recording = false;


void setup() {
  frameRate(30);
  fullScreen(1);
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

  saveFrames();

  clearFallenKeys();
}

void clearFallenKeys() {
  for (int i = keys.size() - 1; i >= 0 ; i--) {
    if (keys.get(i).isFallen()) {
      keys.remove(i);
    }
  }
}

void saveFrames() {
  if (recording && (framesToSave-- > 0)) {
    saveFrame("out/###.png");
  }
}

void keyPressed() {
  if (key == 's') {
    recording = true;
  }
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
