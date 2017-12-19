import toxi.geom.*;

float val;
int nBalls = 50000;
boolean pause = false;

PImage img;

Ball b;
Ball[] manyBalls = new Ball[nBalls];

void setup() {
  size(800, 600,P2D); //
  smooth();
  noStroke();
  img = loadImage("Co-de-iT_noise_bg_blur.jpg");
  //img = loadImage("portrait.jpg");
  img.resize(width,height);
  img.loadPixels();

  for (int i=0; i<nBalls; i++) {
    b = new Ball(new Vec2D(random(width), random(height)));
    manyBalls[i]=b;
  }
  
   background(255);
}

void draw() {
  if (pause) {
    noLoop();
  }
  else {
    loop();
  }

  // update & display

  for (int i=0; i<nBalls; i++) {   
    Ball b = manyBalls[i];
    b.displayPoint();
    val = brightness(img.pixels[floor(b.pos.x)+width*floor(b.pos.y)])/255.0;
    b.moveNoise(val);
    b.wrap();
  }

} // end draw

void keyPressed() {

  switch(key) {
  case ' ':
    pause = !pause;
    if (pause)
    { noLoop();}
    else {loop();}
    break;

  case 's':
    saveFrame("images/logo_####.png");
    break;
    
  }
}

