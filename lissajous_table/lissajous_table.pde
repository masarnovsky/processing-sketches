int w = 70;
int rows, cols;
float alpha = 0;
int mode = 1;
Curve[][] curves;

void setup() {
   size(700, 700, P2D);
   cols = width/w - 1;
   rows = height/w - 1;
   curves = new Curve[rows][cols];

   for (int i = 0; i < cols; i++) {
      for (int j = 0; j < rows; j++) {
        curves[i][j] = new Curve();
      }
   }
}

void draw() {
    background(0);
    stroke(255);
    noFill();

    float d = w-10;
    float r = d/2;

    for (int i = 0; i < cols; i++) {
       float cx = w + w * i + w/2;
       float cy = w/2;

       float x = r * cos((i+1)*alpha - HALF_PI);
       float y = r * sin((i+1)*alpha - HALF_PI);

       if (mode == 1) {
         noFill();
         stroke(255);
         ellipse(cx, cy, d, d);

         fill(255);
         ellipse(cx + x, cy + y, 4, 4);

         stroke(255, 50);
         strokeWeight(1);
         line(cx+x, cy + y, cx+x, height);
       }

       for (int j = 0; j < rows; j++) {
           curves[i][j].setX(cx + x);
       }
    }

    for (int j = 0; j < rows; j++) {
        float cx = w/2;
        float cy = w + w * j + w/2;

        float x = r * cos((j + 1) * alpha - HALF_PI);
        float y = r * sin((j + 1) * alpha - HALF_PI);

        if (mode == 1) {
          noFill();
          stroke(255);
          ellipse(cx, cy, d, d);

          fill(255);
          ellipse(cx + x, cy + y, 4, 4);

          noFill();
          stroke(255, 50);
          strokeWeight(1);
          line(cx + x, cy + y, width, cy+y);
        }

        for (int i = 0; i < cols; i++) {
           curves[i][j].setY(cy + y);
       }
    }

    for (int i = 0; i < cols; i++) {
      for (int j = 0; j < rows; j++) {
        curves[i][j].addPoint();
        curves[i][j].show();
      }
   }

    alpha += 0.01;
    if (alpha > TWO_PI) {
      for (int i = 0; i < cols; i++) {
        for (int j = 0; j < rows; j++) {
            curves[i][j].reset();
          }
       }
      alpha = 0;
      saveFrame("lissajous#####.png");
    }
}

void keyPressed() {
   if (key == 'm') {
     mode *= -1;
   }
}
