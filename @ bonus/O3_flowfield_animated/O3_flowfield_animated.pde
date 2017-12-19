
/* 
 
 Oo° - Object Oriented Ornament
 P5 Co-de-iT workshop Cava dei Tirreni - 22>24 November 2013
 tutor: Alessio Erioli
 
 animated flowfield
 
 */

int cols = 20;
int rows = 40;
float step = 0.1;

PVector[][] field = new PVector[rows][cols];
PVector[][] grid = new PVector[rows][cols];

void setup() {

  size(800, 500);
  setField(step);
  setGrid();
}


void draw() {
  background(253);
  updateField(step, frameCount*0.005);
  for (int i = 0; i < rows; i++) {
    for (int j = 0; j < cols; j++) {
      display(grid[i][j], field[i][j]);
    }
  }
}

void setField(float step) {
  float xoff = 0;
  for (int i = 0; i < rows; i++) {
    float yoff = 0;
    for (int j = 0; j < cols; j++) {
      //[offset-up] Noise
      float theta = map(noise(xoff, yoff,0), 0.0, 1.0, 0.0, TWO_PI);
      field[i][j] = new PVector(cos(theta), sin(theta));
      yoff += step;
    }
    xoff += step;
  }
}

void updateField(float step, float timeStep) {
  float xoff = 0;
  for (int i = 0; i < rows; i++) {
    float yoff = 0;
    for (int j = 0; j < cols; j++) {
      //[offset-up] Noise
      float theta = map(noise(xoff, yoff, timeStep), 0, 1.0, 0, TWO_PI);
      field[i][j] = new PVector(cos(theta), sin(theta));
      yoff += step;
    }
    xoff += step;
  }
}

void setGrid(){
  float xoff = width/(float)(rows-1);
  float yoff = height/(float)(cols-1);
  for (int i = 0; i < rows; i++) {
    for (int j = 0; j < cols; j++) {
      //[offset-up] Noise
      grid[i][j] = new PVector(i*xoff, j*yoff);

    }
  }

}

void display (PVector s, PVector s1) {
  PVector s2 = PVector.mult(s1,30);
  PVector e = PVector.add(s, s2);
  //e.mult(0.2);
  stroke(0, 80);
  strokeWeight(1);
  line (s.x, s.y, e.x, e.y);
  stroke(255,0,0);
  strokeWeight(3);
  point(e.x, e.y);
}
