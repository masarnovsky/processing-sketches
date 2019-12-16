float xLocation;
float yLocation;
int winSize = 600;

void setup() {
  size(600, 600); // ==winSize
  background(255);
  xLocation = random(winSize);
  yLocation = random(winSize);
}

void draw() {
  float newXLocation = xLocation + random(-50, 50);
  float newYLocation = yLocation + random(-50, 50);
  
  if (newXLocation < 0)
    newXLocation = 0;
  if (newXLocation > winSize)
    newXLocation = winSize;

  if (newYLocation < 0)
    newYLocation = 0;
  if (newYLocation > winSize)
    newYLocation = winSize;

  line(xLocation, yLocation, newXLocation, newYLocation);
  fill(random(255), random(255), random(255), 50);
  float circleSize = random (3, 50);
  ellipse(newXLocation, newYLocation, circleSize, circleSize);

  xLocation = newXLocation;
  yLocation = newYLocation;
}
