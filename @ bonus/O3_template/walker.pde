
class Walker {

  Vec2D loc, futLoc;
  boolean alive=true;
  ArrayList<Vec2D> trail= new ArrayList<Vec2D>();

  Walker (World w, Vec2D loc) {
    this.loc = loc;
    trail.add(loc);
    futLoc = new Vec2D();
  }

  void update() {
    if (alive && walk) {
      //moveNoise();
      moveRand();
      checkborders();
    }
    displayM();
  }

  void moveNoise() {
    futLoc.x = loc.x + round(abs(cos(noise(loc.x * w.noiseScale+w.noiseInc, loc.y * w.noiseScale+w.noiseInc) * TWO_PI)));
    futLoc.y = loc.y + signum(-sin(noise(loc.x * w.noiseScale+w.noiseInc, loc.y * w.noiseScale+w.noiseInc) * TWO_PI));
  }

  void moveRand() {
    futLoc.x = loc.x+ 1;//+round(random(-1,0));
    futLoc.y = loc.y + round(random(-1, 1));
  }

  void checkborders() {
    if (futLoc.x<0 || futLoc.x >xPt || futLoc.y < 0 || futLoc.y > yPt) {
      alive = false;
    }
    else {
      trail.add(new Vec2D(futLoc));
      loc = futLoc;
    }
  }

  void displayM() {
    pushStyle();
    fill(0, 255, 255);
    noStroke();
    //strokeWeight(1.1);
    beginShape(QUAD_STRIP);
    for (int i=0; i< trail.size(); i++) {
      Vec2D v1 = trail.get(i);
      Vec3D v = w.pos(int(v1.x), int(v1.y));
      float thick = map(v.z, -w.zMax, w.zMax, 0.1, 2);
      vertex(v.x, v.y, v.z);
      vertex(v.x, v.y+thick, v.z);
    }
    endShape();
    popStyle();
  }

}


float signum(float x) {
  if (x == 0.0) return 0;
  else if (x < 0.0) return -1.0;
  else return 1.0;
}

