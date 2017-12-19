
/* 
 
 Oo° - Object Oriented Ornament
 P5 Co-de-iT workshop Cava dei Tirreni - 22>24 November 2013
 tutor: Alessio Erioli
 
 basic particles with mouse seek behaviour
 
 */

import toxi.geom.*;

int nPts = 500;
ArrayList <Particle> pts; // flagged ArrayList

void setup() {

  size(900, 400);
  smooth();

  pts = new ArrayList <Particle>();

  for (int i=0; i<nPts; i++) {
    Vec3D v = new Vec3D(random(width), random(height), 0);
    Particle p = new Particle(v);
    pts.add(p);
  }
  background(0);
}


void draw() {
  background(0);

  for (Particle p : pts) {
    p.update();
  }

  if (mousePressed && mouseButton == LEFT) {
      Particle p = new Particle(new Vec3D(mouseX, mouseY, 0));
      pts.add(p);
  }

  //fill(0,10);
  //rect(0,0,width, height);
}

