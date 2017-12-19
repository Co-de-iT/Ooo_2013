import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import peasy.*; 
import toxi.geom.*; 
import toxi.geom.mesh.*; 
import toxi.processing.*; 
import controlP5.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class day03_bracelet_designer extends PApplet {


/* 
 
 Oo\u00b0 - Object Oriented Ornament
 P5 Co-de-iT workshop Cava dei Tirreni - 22>24 November 2013
 tutor: Alessio Erioli
 
 bracelet designer
 
 keys:
 
 b: bend geometry
 i: save image
 e: export .stl mesh in export_data folder
 
 */







int xPt=250, yPt=100;            // n. of points in x & y
float xSize = 500, ySize = 200;  // size in x & y
float amp = 5;
float freq = 5;
float noiseScale;
float ns = 200.0f;
float ang = PI;
float rad = 200;

boolean bend = false;

Vec3D[][] pts = new Vec3D[xPt][yPt];

TriangleMesh mesh;
ToxiclibsSupport gfx;

PeasyCam cam;
ControlP5 c5;

public void setup() {

  //size(1200, 600, P3D);
  size(displayWidth /2, displayHeight, P3D);


  cam = new PeasyCam(this, xSize/2, ySize/2, 0, 300);

  mesh = new TriangleMesh("meshy");
  gfx = new ToxiclibsSupport(this);
  c5 = new ControlP5(this);
  c5_setup();            // initialize interface
  c5.setAutoDraw(false); // do not autodraw interface!


  // mesh build in static mode
  //setPts();
  //buildMesh();
} // end setup



public void draw() {
  background(0);
  //lights();
  directionalLight(255, 52, 228, 0, 1, 1);// 50, 50, 255
  directionalLight(220, 220, 200, -1, 1, -1);
  ambientLight(0, 0, 0);
  lightSpecular(200, 200, 200);
  specular(255, 255, 255);
  shininess(255.0f);

  checkOverlap();
  noiseScale = freq/ns;

  //_______3D
  mesh.clear();
  pts = new Vec3D[xPt][yPt];
  if (bend) {
    setPts2(xPt, yPt, ang, rad);
  }
  else {
    setPts(xPt, yPt);
  }
  
  buildMesh();

  //fill(0, 250, 230);
  fill(200);
  noStroke();
  //gfx.mesh(mesh, false);
  gfx.meshNormalMapped(mesh, true, 0.3f);

  // stroke(255);
  // displayPts();

  //_________end3D
  noLights();
  cam.beginHUD();
  c5.draw();
  cam.endHUD();
}

public void keyPressed() {
  if (key=='i') saveFrame("images/mesh_####.png");
  if (key=='e') exportMesh();
  if (key=='b') bend = !bend;
}

public void exportMesh() {
  mesh.saveAsSTL(sketchPath("export_data\\mesh_"+frameCount+".stl"));
  println("mesh exported!");
}

public void face() {
  beginShape();
  fill(255, 0, 0);
  vertex(0, 0, 0);
  fill(255, 255, 0);
  vertex(150, 0, 50);
  fill(0, 255, 255);
  vertex(150, 200, 0);
  fill(0, 0, 255);
  vertex(0, 200, 150);
  endShape(CLOSE);
}

public void c5_setup() {

  
  // sets colors for user interface
  c5.setColorBackground(color(0,2))            // background color
    .setColorForeground(color(120))            // foreground color
      .setColorActive(color(255, 52, 228));    // highlight color

  //            var   min  max  default   x   y  l   h
  c5.addSlider("amp", 0, 10, amp, 10, 10, 200, 10);
  c5.addSlider("freq", 1, 20, freq, 10, 30, 200, 10);
  c5.addSlider("ns", 1, 500, ns, 10, 50, 200, 10);
  c5.addSlider("ang", PI/6, 2*PI, ang, 10, 70, 200, 10);
  c5.addSlider("rad", 50, 300, rad, 10, 90, 200, 10);


  c5.addSlider("xPt", 50, 500, xPt, 10, 110, 200, 10);
  c5.addSlider("yPt", 50, 500, yPt, 10, 130, 200, 10);
}


public void checkOverlap() {

  if (c5.window(this).isMouseOver()) {
    cam.setActive(false);
  }
  else {
    cam.setActive(true);
  }
}


public void setPts(int xPt, int yPt) {
  float xStep=xSize/xPt, yStep= ySize/yPt, z, zSize;

  zSize = amp*(xPt/50.0f);
  
  for (int i=0; i< xPt; i++) {
    for (int j=0; j<yPt; j++) {
     
      //z = (sin(i/5)+cos(j/5))*amp;
      //z = zSize*(sin(i*noiseScale*10)+cos(j*noiseScale*10)*cos(i*j/200.0));
      z = zSize*(sin(i*noiseScale*10)+cos(j*noiseScale*10)*cos(i*j/200.0f))
      *map(noise(i*noiseScale,j*noiseScale),0,1,-1,1);

      pts[i][j] = new Vec3D(i*xStep, j*yStep, z);
    }
  }
} // end setPts

// calculates points in bend mode:
public void setPts2(int xPt, int yPt, float ang, float rad) {
  float xStep=xSize/xPt, yStep= ySize/yPt, z, zSize;
  float xAng;
  
  zSize = amp*(xPt/50.0f);
  xAng = ang/xPt;
  for (int i=0; i< xPt; i++) {
    for (int j=0; j<yPt; j++) {
      
      //z = (sin(i/5)+cos(j/5))*amp;
      //z = zSize*(sin(i*noiseScale*10)+cos(j*noiseScale*10)*cos(i*j/200.0));
      z = rad+zSize*(sin(i*noiseScale*10)+cos(j*noiseScale*10)*cos(i*j/200.0f))
      *map(noise(i*noiseScale,j*noiseScale),0,1,-1,1);

      pts[i][j] = new Vec3D(xSize/2+z*cos(i*xAng), j*yStep, z*sin(i*xAng));
    }
  }
} // end setPts2


public void buildMesh() {

  for (int i=0; i< xPt-1; i++) {
    for (int j=0; j<yPt-1; j++) {

      mesh.addFace(pts[i][j], pts[i][j+1], pts[i+1][j]);
      mesh.addFace(pts[i][j+1], pts[i+1][j+1], pts[i+1][j]);
      
    }
  }
} // end buildMesh

public void displayPts() {
  pushStyle();
  stroke(255);
  strokeWeight(3);
  for (int i=0; i< xPt; i++) {
    for (int j=0; j<yPt; j++) {

      point(pts[i][j].x, pts[i][j].y, pts[i][j].z);
    }
  }
  popStyle();
} // end displayPts

  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "--full-screen", "--bgcolor=#666666", "--stop-color=#cccccc", "day03_bracelet_designer" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
