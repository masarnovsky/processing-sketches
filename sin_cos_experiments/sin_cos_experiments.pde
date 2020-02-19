// for basic example
float angle = 0, angle2 = 180;
int r = 60, r2 = 100, rand=500;

float rand1, rand2, rand3, rand4;

boolean defaultColor = true;

void setup() {
  size(600, 600);
  background(0);
  noFill();
  stroke(255, 40);

  rand1 = random(rand);
  rand2 = random(rand);
  rand3 = random(rand);
}
void draw() {
  // basic();
  experiment5();
}

void experiment1() {
  float t = (float) frameCount;
  translate(width/2, height/2);
  ellipse(sin(40) * 100, cos(t/40) * 100 , t,t);
}

void experiment2() {
  float t = (float) frameCount;
  translate(width/2, height/2);
  ellipse(sin(40) * 100, cos(t/40) * 100 , t*sin(t),(t/2)*sin(t));
}

void experiment3() {
  float t = (float) frameCount;
  translate(width/2, height/2);
  rotate(rand1/111);
  ellipse(0, 0, sin(t/rand2)*500,cos(t/rand3)*500);
}

void experiment4() {
  float t = (float) frameCount;
  translate(width/2, height/2);
  rotate(rand1);
  ellipse(sin(t/140)*200, cos(t/140)*200, sin(t/rand2)*200,cos(t/rand3)*200);
}

void experiment5() {
  float t = (float) frameCount;
  translate(width/2, height/2);
  rotate(t/200);
  line(sin(t/140)*200+cos(t/30)*30, cos(t/140)*200 + sin(t/30)*30,
      atan(t/140)*200+sin(t/30)*39, cos(t/140)*200+cos(t/30)*30);
}

void MmeansMAX() {
  float t = (float) frameCount;
  translate(width/2, height/2);
  ellipse(sin(t/80) * 100, cos(t/20) * 100, 50, 50);
}

void mango() {
  float t = (float) frameCount;
  translate(width/2, height/2);
  ellipse(sin(t/80) * 100, cos(t/78) * 100, 50, 50);
}

void keyPressed() {

 if (key == 's') {
   pushMatrix();
   translate(0, 0);
   rotate(rand1*111);
   textSize(12);
   saveFrame("experiments" + "rand1-" + rand1 + "_rand2-" + rand2 + "_rand3_" + rand3 +"-######.png");
   popMatrix();
 }

 if (key == 'n') {
   background(0);

   rand1 = random(rand);
   rand2 = random(rand);
   rand3 = random(rand);
 }
}

void basic() {
  float x = width/2 + r * cos(radians(angle));
  float y = height/2 + r * sin(radians(angle));
  ellipse(x, y, 40, 40);

  float x2 = width/2 + r2 * cos(radians(angle2));
  float y2 = height/2 + r2 * sin(radians(angle2));

  ellipse(x2, y2, 40, 40);

  angle += 10.3;
  angle2 -= 5.3;
  //r+= 0.3;
  //r2 += 0.3;
}
