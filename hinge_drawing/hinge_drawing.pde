float r = 160;
float theta = 0;
ArrayList<PVector> points = new ArrayList();

float r2 = 70;
float theta2 = -0.5;
void setup() {
  size(600,600);
}

void draw() {
   background(255);
   strokeWeight(2);
   stroke(0);
   
   float x = r * cos(theta);
   float y = r * sin(theta);
   ellipse(x + width/2, y + height/2, 2,2);
   ellipse(width/2, height/2, 2,2);
   float lineX1 = x + width/2;
   float lineY1 = y + height/2;
   line(lineX1, lineY1, width/2, height/2);
   theta += 0.01;
   
   float x2 = r2 * cos(theta2);
   float y2 = r2 * sin(theta2);
   float pointX = 100;
   float pointY = 100;
   ellipse(x2 + pointX, y2 + pointY, 2,2);
   ellipse(pointX, pointY, 2,2);
   float lineX2 = x2 + pointX;
   float lineY2 = y2 + pointY;
   line(lineX2, lineY2, pointX, pointY);
   theta2 += 0.02;
   
   stroke(255,0,0);
   float centerX = (lineX2 + lineX1)/2 ;
   float centerY = (lineY2 + lineY1)/2;
   line(lineX1, lineY1, lineX2, lineY2);
   fill(255,0,0);
   ellipse(centerX, centerY, 4,4);
   points.add(new PVector(centerX, centerY));
   
   for (PVector p: points) {
     point(p.x, p.y);
   }
   r+=0.01;
}
