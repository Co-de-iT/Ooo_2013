
/* 
 
 Oo° - Object Oriented Ornament
 P5 Co-de-iT workshop Cava dei Tirreni - 22>24 November 2013
 tutor: Alessio Erioli
 
 Jitterbug - simple class example with cascade constructors
 
 */

JitterBug bug, bug2, spencer, hill;

void setup() {
  size(400, 700);
  smooth();
  //                         loc             diam  speed     col
  bug = new JitterBug (new PVector(150, 450), 80, 3, color(200, 8, 50));
  bug2 = new JitterBug (new PVector(150, 450), 30, 5, color(#FFFF00));
  spencer = new JitterBug(new PVector(random(width), random(height)), 50, 4, color(210, 210, 210));
  hill = new JitterBug();
  background(130);
  //noStroke();
  println("new Jitterbug created in x: ", bug.loc.x, ", y: ", bug.loc.y);
}

void draw() {

  bug.update();
  bug2.update();
  spencer.update();
  hill.update();
}

void keyPressed() {
  if (key=='i') saveFrame("images/JitterBugs_####.png");
}

