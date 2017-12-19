// drawing machine

float thres = 50;
boolean symmetry = false;
ArrayList <PVector> pts = new ArrayList <PVector>();

void setup() {
  size(900, 400);
  smooth();

  noFill();
}


void draw() {
  if (symmetry) {
    background(0);
    stroke(250,20);
  }
  else {
    background(230);
    stroke(20, 20);
  }
  if (mousePressed) {
    pts.add(new PVector(mouseX, mouseY));
    if (symmetry) pts.add(new PVector(-mouseX+width, mouseY));
  }
  if (pts.size()>2) display();
}

void display() {

  for (int i=0; i< pts.size()-1; i++) {
    PVector p = pts.get(i);
    for (int j=i+1; j< pts.size(); j++) {
      PVector q = pts.get(j);
      float d = PVector.dist(p, q);
      if (d>5 && d<thres) line(p.x, p.y, q.x, q.y);
    }
  }
}

void keyPressed() {
  if (key=='s') symmetry = !symmetry;
}

