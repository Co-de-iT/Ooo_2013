class World {
  int xPt, yPt, nFr, nWks;
  float amplitude, noiseInc, noiseSpeed, noiseScale, freq, zMax;
  ArrayList<Walker> wks = new ArrayList<Walker>();

  World (int xPt, int yPt, float amplitude, float freq, float noiseSpeed, int nWks) {
    this.xPt = xPt;
    this.yPt = yPt;
    this.amplitude = amplitude;
    this.freq = freq;
    this.noiseSpeed = noiseSpeed;
    this.nWks = nWks;

    zMax = amplitude * ((xPt)/50);
    noiseScale = freq/200;
    noiseInc = nFr/noiseSpeed;
    // walkers setup

    for (int i=0; i<nWks; i++) {
      Walker w = new Walker (this, new Vec2D(0, int(random(0, yPt))));
      wks.add(w);
    }
  }

  void setValues(float amplitude, float freq, float noiseSpeed) {
    this.freq = freq;
    this.amplitude = amplitude;
    this.noiseSpeed = noiseSpeed;
  }

  void update(boolean go, boolean ptDraw, boolean walk) {
    if (go) nFr++;
    zMax = amplitude * ((xPt)/50);
    noiseScale=freq/200;
    noiseInc = nFr/noiseSpeed;
    if (ptDraw)  display();
    updateWalkers();
  }

  void display() {
    float zCol;
    pushStyle();
    strokeWeight(2);
    for (int i=0;i<xPt; i++) {
      for (int j=0; j<yPt; j++) {

        ///// noise definition

        noiseScale=freq/200;            // noise scale as freq ratio
        Vec3D p = pos(i, j);
        zCol = abs(p.z/zMax);
        if (p.z <0) {
          stroke(lerpColor(mid, a, zCol));                 // color of stroke by height
        }
        else {
          stroke(lerpColor(mid, b, zCol));
        }

        point(p.x, p.y, p.z);
      }
    }
    popStyle();
  }

  void updateWalkers() {
    for (Walker v:wks) {
      //println(v.alive);
      v.update();
    }
  }

  Vec3D pos (int i, int j) {
    return new Vec3D((xSize/xPt)*i, (ySize/yPt)*j, zMax*(noise(i*noiseScale+noiseInc, j*noiseScale+noiseInc)-0.5)*2);
  }
}

