
import peasy.*;
import toxi.geom.*;
import toxi.geom.mesh.*;
import toxi.processing.*;
import controlP5.*;

int xPt=250, yPt=100;            // n. of points in x & y
float xSize = 500, ySize = 200;  // size in x & y
float amp = 5;
float freq = 5;
float noiseScale;
float ns = 200.0;
float ang = PI;
float rad = 200;

boolean bend = false;

Vec3D[][] pts = new Vec3D[xPt][yPt];

TriangleMesh mesh;
ToxiclibsSupport gfx;

PeasyCam cam;
ControlP5 c5;

void setup() {

  size(1280, 800, P3D);


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



void draw() {
  background(0);
  lights();
  directionalLight(255, 52, 228, 0, 1, 1);// 50, 50, 255

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
  gfx.mesh(mesh, false);
  //gfx.meshNormalMapped(mesh, true, 0.3);

  // stroke(255);
  // displayPts();

  //_________end3D
  noLights();
  cam.beginHUD();
  c5.draw();
  cam.endHUD();
}

void keyPressed() {
  if (key=='i') saveFrame("images/mesh_####.png");
  if (key=='e') exportMesh();
  if (key=='b') bend = !bend;
}

void exportMesh() {
  mesh.saveAsSTL(sketchPath("mesh_"+frameCount+".stl"));
  println("mesh exported!");
}

void face() {
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