
/* 
 
 Oo° - Object Oriented Ornament
 P5 Co-de-iT workshop Cava dei Tirreni - 22>24 November 2013
 tutor: Alessio Erioli
 
 easing - how to smooth arrival motion
 
 */

PVector p;
float thres = 150;
float easing =0.5;
float maxSpeed = 15;
void setup() {
  size(800, 800);
  p = new PVector(width/2, height/2);
  noStroke();
  fill(20);
}


void draw() {
  background(230);
  PVector m = new PVector(mouseX, mouseY);
  PVector s = PVector.sub(m, p);
  float mag = s.mag();

  pushStyle();
  fill(200, 50);
  ellipse(m.x, m.y, thres*2, thres*2);
  popStyle();


  s.normalize();
  if (mag<thres) {
    s.mult(maxSpeed*sin(map((mag/thres)*easing, 1, 0, PI/2, 0)));
  }
  else {
    s.mult(maxSpeed);
  }
  p.add(s);
  ellipse(p.x, p.y, 5, 5);
}

