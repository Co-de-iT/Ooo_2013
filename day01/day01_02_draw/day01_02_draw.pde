
/* 
 
 Oo° - Object Oriented Ornament
 P5 Co-de-iT workshop Cava dei Tirreni - 22>24 November 2013
 tutor: Alessio Erioli
 
 draw - use mouse as a brush
 
 */

float alpha;
// void: tipo di funzioni che non restituiscono valori
void setup() {
  size(400,400);
  smooth();
  // background(120); // grayscale
  background(120,0,0); // R, G, B
  
} // end setup



void draw() {
  //background(120,0,0);
  //point(250, 300);
  // stroke(0,200,200); // colore del tratto
  //strokeWeight(1);
  // fill(0);
  // ellipse(250, 200, 100,100); // disegna un ellisse
  
  //stroke(0);
  //                a    Rmin  RMax   R1min  R1Max
  // alpha = map(mouseX,  0,  width,   0,    255);
  noStroke();
  alpha = map(sin(frameCount/20.0), -1, 1, 10, 50);
  fill(255, alpha);
  ellipse(mouseX, mouseY, 20,20);

} // end draw

