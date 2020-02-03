int w, h;
int totalPetals = 360;
Petal[] petals = new Petal[totalPetals];
float radius = 40;
float rotation = 0.0;
float angle = 137.5077640844293;
float ToRadians = PI / 180.0;

void setup() {
  size(1200, 700);
  noStroke();
  smooth();
  background(0);

  for (int i = 0; i < totalPetals; i++) {
     rotation += angle;
     radius *= 1.0049;
     Petal p = new Petal();
     p.x = width/2 + radius*(cos(rotation*ToRadians));
     p.y = height/2 + radius*(sin(radians(rotation)));
     p.rotation = radians(rotation);
     p.scaleVar += (i * 2) / totalPetals;
     p.render();
  }
}

void draw() {

}

class Petal {
  float x = 0.0;
  float y = 0.0;
  float rotation = 0.0;
  float scaleVar = 1.0;

  color baseColor = color(0, 255, 255, 150);
  color detailColor = color(255, 255, 255, 160);
  color trimColor = color(0,0,0);

  void render() {
    pushMatrix();
    translate(this.x, this.y);
    scale(this.scaleVar, this.scaleVar);
    fill(this.baseColor);
    ellipse(0, 0, 10, 10);
    fill(this.detailColor);
    //pushMatrix();
    rotate(this.rotation);
    rect(-10, -1, 20, 1);
    //popMatrix();

    popMatrix();
  }
}
