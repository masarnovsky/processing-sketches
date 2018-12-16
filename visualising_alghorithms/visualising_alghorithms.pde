float [] array;
int i = 0;
int j = 0;

void setup() {
  size(800,500);
  array = new float[width];
  for (int i=0; i < array.length; i++) {
    array[i] = random(height);
  }
}

void draw() {
  background(0);
  stroke(255);
  
  
  if (i < array.length) {
    for (int j =0; j < array.length - i - 1; j ++) {
      float a = array[j];
      float b = array[j+1];
      if (a > b) {
        swap(array, j, j+1);
      }
    }
    i++;
  } else {
    println("finished");
    noLoop();
  }
  
  for (int i = 0; i < array.length; i++) {
    line(i, height, i, height - array[i]);
  }
}

void swap(float[] arr, int i, int j) {
  float temp = arr[i];
  arr[i] = arr[j];
  arr[j] = temp;
}
