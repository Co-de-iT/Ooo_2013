
/* 
 
 Oo° - Object Oriented Ornament
 P5 Co-de-iT workshop Cava dei Tirreni - 22>24 November 2013
 tutor: Alessio Erioli
 
 basic use of agents in 3D - see Plethora examples and documentation
 maps Separation value along x and displays a data gradient
 
 */

import plethora.core.*;
import toxi.geom.*;
import peasy.*;


PeasyCam cam;
ArrayList<Ple_Agent> boids;

int nBoids = 200;

float dimX = 800.0, dimY=800.0, dimZ=300.0;

void setup() {
  size(600, 600, P3D);
  smooth();
  cam = new PeasyCam(this, 1000); // PApplet

  boids = new ArrayList<Ple_Agent>();

  for (int i=0; i<nBoids; i++) {
    // create new agent in (0,0,0)
    Ple_Agent boid = new Ple_Agent(this, new Vec3D());
    //Ple_Agent boid = new Ple_Agent(this, new Vec3D(random(-dimX/2,dimX/2),
    //random(-dimY/2,dimY/2), random(-dimZ/2,dimZ/2)));
    // set initial speed
    Vec3D speed = new Vec3D(random(-1, 1), random(-1, 1), random(-1, 1));
    //Vec3D speed = new Vec3D(0,1,0);
    boid.setVelocity(speed);

    // initialize tail
    boid.initTail(20);

    // add to collection
    boids.add(boid);
  }
}


void draw() {
  background(230);

  for (Ple_Agent boid: boids) {

    float si = map(boid.loc.x, -dimX/2, dimX/2, 0.1, 5); // mapping separation
    // flocking behaviour
    //                Cr Ar Sr  Ci  Ai  Si
    boid.flock(boids, 80, 40, 30, 1, 0.5, si);
    // 80, 40, 30, 1, 0.5, 1.5

    // limit max speed
    boid.setMaxspeed(3);

    // boundary behaviour
    //boid.wrapSpace(dimX/2, dimY/2, dimZ/2);
    boid.bounceSpace(dimX/2, dimY/2, dimZ/2);

    // agent update
    boid.update();
    boid.updateTail(5);


    // agent display
    if (frameCount > 200) {
      boid.dropTrail(5, 100);
      stroke(200, 0, 0, 50);
      strokeWeight(0.8);
      boid.drawTrail(200);
    }
    //                end  R G B A s  R G B  A  s  start
    boid.displayTailPoints(0, 0, 0, 0, 1, 0, 0, 0, 255, 2);
    stroke(20, 90);
    strokeWeight(1);
    boid.displayDir(20);
    stroke(255, 0, 0);
    strokeWeight(2);
    boid.displayPoint();
  } // end for(Ple_Agent boid: boids)

  drawBox(dimX, dimY, dimZ);
  dispGrad(0.1, 5, 50);
} // end draw


// visualize separation data gradient
void dispGrad(float min, float max, int num) {
  pushStyle();
  fill(0);
  noStroke();
  beginShape(QUAD_STRIP);
  float step = dimX/float(num-1);
  for (int i=0; i<num; i++) {
    fill(200,map(i, 0, num, 0,200),0);
    vertex((-dimX/2)+step*i, dimY/2+10, -dimZ/2);
    vertex((-dimX/2)+step*i, dimY/2+20, -dimZ/2);
  }
  endShape();
  fill(0);
  stroke(0);
  textAlign(LEFT,TOP);
  text("Smin: "+min,-dimX/2, dimY/2+30, -dimZ/2);
  textAlign(RIGHT,TOP);
  text("Smax: "+max,dimX/2, dimY/2+30, -dimZ/2);
  popStyle();
}

void drawBox(float dimX, float dimY, float dimZ) {

  pushStyle();
  noFill();
  stroke(20, 90);
  strokeWeight(1);
  box(dimX, dimY, dimZ);
  popStyle();
}

