String path = "../sources/mona.png"; // 357x500
String path2 = "../sources/figure.jpeg"; // 512x1024
PImage img;

// SORT BY:
// basic sort +
// output an original image and sorted
// vertical sort
// threeshold
// by color
// romove some color from sorting
// sort area in rectangle
// implement merge sort

void setup() {
  size(512, 1024);
  img = loadImage(path2);
  
  loadPixels();
  img.loadPixels();
  
  //basicPixelSorting();
  
  
  
  updatePixels();
}

void basicPixelSorting() {
  int[] temp = new int[height];
  for (int y = 0; y < height; y++) {
    int pos = y*width;
    arrayCopy(img.pixels, pos, temp, 0, width);
    temp = sort(temp);
    arrayCopy(temp, 0, pixels, pos, width);
  }
}
