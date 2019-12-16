PGraphics pg;
PGraphics pg2;

void setup() {
  size(500,500);
  pg = createGraphics(100, 100);
  pg2 = createGraphics(65, 200);
}

void draw() {
  fill(0,5);
  rect(0,0,width, height);
  fill(255);
  noStroke();
  ellipse(mouseX, mouseY, 60,60);

  pg.beginDraw();
  pg.background(233, 209, 109);
  pg.noFill();
  pg.stroke(255);
  pg.ellipse(mouseX-50, mouseY-50, 60, 60);
  pg.endDraw();
  image(pg, 50,50);

  pg2.beginDraw();
  pg2.background(0,255,0);
  pg2.fill(255,0,0,50);
  pg2.stroke(0,0,255);
  pg2.ellipse(mouseX-200,mouseY-200,50,50);
  pg2.endDraw();
  image(pg2, 200,200);
}
