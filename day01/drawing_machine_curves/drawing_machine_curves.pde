
/* 
 
 Oo° - Object Oriented Ornament
 P5 Co-de-iT workshop Cava dei Tirreni - 22>24 November 2013
 tutor: Alessio Erioli
 
 drawing machine - curves
 
 */

ArrayList <PVector> pts = new ArrayList <PVector> ();
float thres = 50;
boolean invert = false;

void setup() {
  size(900, 400);
  smooth();
  noFill();
} // end setup

void draw() {
  if (invert) {
    background(20);
    stroke(230, 20);
  }
  else {
    background(230);
    stroke(20, 20);
  }
  if (mousePressed) {
    pts.add(new PVector(mouseX, mouseY));
    pts.add(new PVector(width-mouseX, mouseY));
  }

  if (pts.size() >2) displayCurves();
}

void display() {
  for (int i=0; i<pts.size()-1;i++) {
    PVector p = pts.get(i);
    for (int j=i+1; j<pts.size();j++) {
      PVector p1 = pts.get(j);
      float d = PVector.dist(p, p1);
      if (d>5 && d<thres) line(p.x, p.y, p1.x, p1.y);
    }
  }
}

void displayCurves(){
  for(PVector p:pts){
    bezier(width/2, height,  width/2, p.y/3, (width/2+p.x)/2,  p.y,  p.x,  p.y);
    //       ^p1x     ^p1y  | ^p2x    ^p2y  |    ^p3x         ^p3y | ^p4x  ^p4y
  }
}

void keyPressed() {
  if (key=='i') invert = !invert;
  if (key=='s') saveFrame("images/flower_####.png");
}

