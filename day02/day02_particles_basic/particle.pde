class Particle {

  // fields

  Vec3D loc;
  Vec3D speed = new Vec3D (random(-1f, 1f), random(-1f, 1f), 0);
  float maxSpeed = 1.5;
  float diam = 2;
  ArrayList <Vec3D> tail;
  int nTail = 10;
  int tailFreq = 8;

  // constructor(s)

  Particle(Vec3D _loc) {
    loc = _loc;
    tail = new ArrayList<Vec3D>();
    // for faster display we create a full-length tail from the beginning
    for (int i=0; i< nTail; i++) {
      tail.add(new Vec3D(loc));
    }
  }

  // methods

  void update() {
    move();
    bounce();
    if (mousePressed && mouseButton == RIGHT) seekMouse(0.05); // a negative value (-0.05) makes particles flee
    upTail(tailFreq);
    display();
    dispTail();
  }

  void move() {
    speed.limit(maxSpeed);
    loc.addSelf(speed);
  }

  void seekMouse(float strength) {
    // store mouse position
    Vec3D mousePos = new Vec3D(mouseX, mouseY, 0);
    // calc steer vector
    Vec3D steer = mousePos.sub(loc);
    if (steer.magnitude()<200) {
      steer.normalizeTo(strength);
      // add steer to speed
      speed.addSelf(steer);
    }
  }

  void bounce() {
    if (loc.x <= 0 || loc.x >= width) speed.x *= -1;
    if (loc.y <= 0 || loc.y >= height) speed.y *= -1;
  }

  void upTail(int freq) {
    if (frameCount%freq==0) {
      tail.add(new Vec3D(loc));
      tail.remove(0);
    }
  }


  void display() {
    pushStyle();
    noStroke();
    fill(255);
    ellipse(loc.x, loc.y, diam, diam);
    popStyle();
  }

  void dispTail() {
    pushStyle();
    for (int i=0; i<nTail;i++) {
      float c = map(i, 0, tail.size(), 0, 255);
      stroke(c);
      strokeWeight(2);
      Vec3D t = tail.get(i);
      point(t.x, t.y);
    }
    popStyle();
  }
}

