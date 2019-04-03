String path = "../sources/mona.png"; // 357x500
String path2 = "../sources/figure.jpeg"; // 512x1024
PImage img, sorted;
int h, w;
int index = 0;

// SORT BY:
// sort by brughtness() | hue()
// vertical sort
// threesholdr
// by color
// remove some color from sorting
// sort area in rectangle
// implement merge sort
// selected area for sorting

void setup() {
  size(714, 500);

  img = loadImage(path);
  sorted = createImage(img.width, img.height, RGB);
  sorted = img.get();
  sorted.loadPixels();
  
  quickSort(sorted.pixels, 0, sorted.pixels.length-1);
  sorted.updatePixels();
  image(sorted, 0, 0);
  image(img, sorted.width, 0);
  
  
}

void draw() {

}

void quickSort(int arr[], int begin, int end) {
    if (begin < end) {
        int partitionIndex = partition(arr, begin, end);
 
        quickSort(arr, begin, partitionIndex-1);
        quickSort(arr, partitionIndex+1, end);
    }
}

int partition(int arr[], int begin, int end) {
    int pivot = arr[end];
    int i = (begin-1);
 
    for (int j = begin; j < end; j++) {
        if (hue(arr[j]) <= hue(pivot)) {
            i++;
 
            int swapTemp = arr[i];
            arr[i] = arr[j];
            arr[j] = swapTemp;
        }
    }
 
    int swapTemp = arr[i+1];
    arr[i+1] = arr[end];
    arr[end] = swapTemp;
 
    return i+1;
}

void sortAnimation() {
  float record = -1;
  int selectedPixel = index;
  for (int j = index; j < sorted.pixels.length; j++) {
    color pix = sorted.pixels[j];
    float b = brightness(pix);
    if (b > record) {
      selectedPixel = j;
      record = b;
    }
  }

  color temp = sorted.pixels[index];
  sorted.pixels[index] = sorted.pixels[selectedPixel];
  sorted.pixels[selectedPixel] = temp;


  if (index < sorted.pixels.length - 1) {
    index++;
  }

  sorted.updatePixels();

  background(0);
  image(sorted, 0, 0);
  image(img, sorted.width, 0);
}

void basicPixelSorting(PImage img) {
  int[] temp = new int[height];
  for (int y = 0; y < height; y++) {
    int pos = y*img.width;
    arrayCopy(img.pixels, pos, temp, 0, img.width);
    temp = sort(temp);
    arrayCopy(temp, 0, pixels, pos, img.width);
  }
}
