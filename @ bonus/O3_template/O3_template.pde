
/* 
 
 Oo° - Object Oriented Ornament
 P5 Co-de-iT workshop Cava dei Tirreni - 22>24 November 2013
 tutor: Alessio Erioli
 
 Use this sketch as example/template for your future sketches
 
 */


// import libraries
import peasy.*;
import controlP5.*;
import toxi.geom.*;
import plethora.core.*;
import toxi.processing.*;

void setup() {
  size(scrX, scrY, P3D);
  smooth();

  logo = loadImage("co-de-it_logo_w.png");

  cursor(CROSS);

  cam = new PeasyCam(this, xSize/2, ySize/2, 0, 350);       // new cam: lookAtX, lookAtY, lookAtZ, distance

  c5 = new ControlP5(this);                                 // new set of GUI controls (in separate tab)

  c5_setup();                                               // sets up ControlP5 GUI elements (see tab)

  c5.setAutoDraw(false);                                    // update maually to control the refresh sequence

  noiseDetail(3, 0);               // noise detail (ocatves, interpolation)

  
  w = new World(xPt, yPt, amplitude, freq, noiseSpeed, nWks);

}


void draw() {
  background(90); // image as background
  stroke(200);
  fill(250);   

  // avoid rotation by mouse drag when using sliders of ControlP5
  checkOverlap();

  /////////////////////////////////////////////////////////////// 

  // DO YOUR 3D-stuff here //////////////////////////////////////

  // draw the 3D stuff here
  w.setValues(amplitude, freq, noiseSpeed); //updates values from sliders
  w.update(go, ptDraw, walk);
 

  // white box & rectangle

    if (boxDraw) {
    pushStyle();
    stroke(sCol);
    strokeWeight(0.5);
    noFill();
    rect(0, 0, xSize, ySize);
    pushMatrix();
    translate(xSize/2, ySize/2);
    box(xSize, ySize, w.zMax*2);
    popMatrix();
    popStyle();
  }

  ///// Ok, enough 3D /////////////////////////////////

  if (guiDraw) gui();                         //draw the 2D stuff in this function
}

///// GUI in separate TAB /////


