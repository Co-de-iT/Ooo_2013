
/* 
 
 Oo° - Object Oriented Ornament
 P5 Co-de-iT workshop Cava dei Tirreni - 22>24 November 2013
 tutor: Alessio Erioli
 
 rectangles - using randomness
 
 */

int xSize=800, ySize = 400;
float diam = 50;
boolean go=true;

void setup() {
  size(displayWidth, displayHeight); // screen-sized canvas - use present (CTRL+SHIFT+R)
  noStroke();
  fill(255,0,0, 50);
  background(0);
  rectMode(CENTER);
}


void draw() {
  //ellipse(average(0, mouseX), height/2, diam, diam);
  if (go) {
    rect(random(width), random(height), random(2, diam), random(2, diam));
  }
}

void keyPressed(){
  if (key==' ') go = !go;
  // boolean operators:
  // && (and) a && b è true solo se sono true sia a che b
  // || (or)  a || b è false solo se sono false sia a che b
  // !  (not) inverte il valore booleano
  if (key=='i') saveFrame("reds/rect_####.png"); // save image
}

// a function that returns the average value of 2 numbers

float average (float x, float y) {
  return ((x+y)/2);
}

