Blob[] blobs = new Blob[4];

void setup() {
  size(800, 800);
  colorMode(HSB);
  for (int i = 0; i < blobs.length; i++) {
    blobs[i] = new Blob(random(width), random(height));
  }
}

void draw() {
  background(36);

  loadPixels();

  for (int x = 0; x < width; x++) {
    for (int y = 0; y < height; y++) {
      int index = x + y * width;

      float sum = 0;
      for (Blob b: blobs) {
        float d = dist(x, y, b.pos.x, b.pos.y);
        sum += 300 * b.r/d;
      }

      pixels[index] = color(sum, 255, 255);
    }
  }

  updatePixels();

  for (int i = 0; i < blobs.length; i++) {
    // blobs[i].show();
    blobs[i].update();
  }
}
