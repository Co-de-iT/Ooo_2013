
/* 
 
 Oo° - Object Oriented Ornament
 P5 Co-de-iT workshop Cava dei Tirreni - 22>24 November 2013
 tutor: Alessio Erioli
 
 drawing machine - exports pdf or dxf
 press mouse button and drag mouse to draw
 
 keys:
 
 i: invert colors
 s: save image
 p: export pdf
 d: export dxf
 
 */


import processing.pdf.*;
import processing.dxf.*;

ArrayList <PVector> pts = new ArrayList <PVector> ();
float thres = 50;
boolean invert = false;
boolean pdf = false;
boolean dxf = false;

void setup() {
  size(800, 400, P2D);
  smooth();
  noFill();
} // end setup

void draw() {
  if (pdf) beginRecord(PDF, "PDF/drawing_Ay_####.pdf");
  if (dxf) beginRaw(DXF, "DXF/drawing_####.dxf");

  strokeWeight(0.5);
  if (invert) {
    background(0);
    stroke(230, 20);
  }
  else {
    background(255);
    stroke(20, 20);
  }

  if (mousePressed) {
    pts.add(new PVector(mouseX, mouseY));
    pts.add(new PVector(width-mouseX, mouseY));
  }



  if (pts.size() >2) display();

  if (pdf) {
    endRecord();
    pdf = false;
  }

  if (dxf) {
    endRaw();
    dxf=false;
  }
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

void keyPressed() {
  if (key=='i') invert = !invert;
  if (key=='s') saveFrame("images/bf_####.png");
  if (key=='p') pdf = true;
  if (key=='d') dxf = true;
}
