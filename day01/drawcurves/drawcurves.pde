
/* 
 
 Oo° - Object Oriented Ornament
 P5 Co-de-iT workshop Cava dei Tirreni - 22>24 November 2013
 tutor: Alessio Erioli
 
 draw curves
 
 */

float vX, vY;
float freq = 100;
float step = 2;

void setup() {
  size(900, 600);
  smooth();
  noFill();
  stroke(150, 40);
  background(230);
  
  vX = 0;
  vY = 0;
}


void draw() {
  //background(230);
  if (mousePressed){
  bezier(width/2, height, width/2, mouseY, mouseX/3*2, mouseY, mouseX, mouseY);
  bezier(mouseX, mouseY, 300, 300, 300, 300, width/2, height);
  vX+=cos(noise((mouseX+vX)/freq, (mouseY+vY)/freq)*TWO_PI)*step;
  vY+=sin(noise((mouseX+vX)/freq, (mouseY+vY)/freq)*TWO_PI)*step;
  //bezier(mouseX+vX, mouseY+vY, 300,300,300,300, width/2, height);
  }
  
}

void keyPressed(){
if (key=='i') saveFrame("images/curves_####.png");
}

