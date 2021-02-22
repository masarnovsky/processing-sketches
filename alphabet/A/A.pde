float l1=0, l2=1000, l3=10000;
float off = 0.01;

void setup() {
  size(700, 700);
}

void draw() {
  background(0);
  stroke(255);

  int s1 =  (int) (noise(l1) * 100);
  int s2 =  (int) (noise(l2) * 100);
  int s3 =  (int) (noise(l3) * 80);

  strokeWeight(s1);
  line(w(), 150, w() - 150, 550);
  strokeWeight(s2);
  line(w(), 150, w() + 150, 550);
  strokeWeight(s3);
  line(275, h(), 425, h());

  l1 += off;
  l2 += off;
  l3 += off;
}

int w() {
  return width/2;
}

int h() {
  return height/2;
}
