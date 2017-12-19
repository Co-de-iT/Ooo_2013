
void setPts(int xPt, int yPt) {
  float xStep=xSize/xPt, yStep= ySize/yPt, z, zSize;

  zSize = amp*(xPt/50.0);
  
  for (int i=0; i< xPt; i++) {
    for (int j=0; j<yPt; j++) {
     
      //z = (sin(i/5)+cos(j/5))*amp;
      //z = zSize*(sin(i*noiseScale*10)+cos(j*noiseScale*10)*cos(i*j/200.0));
      z = zSize*(sin(i*noiseScale*10)+cos(j*noiseScale*10)*cos(i*j/200.0))
      *map(noise(i*noiseScale,j*noiseScale),0,1,-1,1);

      pts[i][j] = new Vec3D(i*xStep, j*yStep, z);
    }
  }
} // end setPts

void setPts2(int xPt, int yPt, float ang, float rad) {
  float xStep=xSize/xPt, yStep= ySize/yPt, z, zSize;
  float xAng;
  
  zSize = amp*(xPt/50.0);
  xAng = ang/xPt;
  for (int i=0; i< xPt; i++) {
    for (int j=0; j<yPt; j++) {
      
      //z = (sin(i/5)+cos(j/5))*amp;
      //z = zSize*(sin(i*noiseScale*10)+cos(j*noiseScale*10)*cos(i*j/200.0));
      z = rad+zSize*(sin(i*noiseScale*10)+cos(j*noiseScale*10)*cos(i*j/200.0))
      *map(noise(i*noiseScale,j*noiseScale),0,1,-1,1);

      pts[i][j] = new Vec3D(xSize/2+z*cos(i*xAng), j*yStep, z*sin(i*xAng));
    }
  }
} // end setPts2


void buildMesh() {

  for (int i=0; i< xPt-1; i++) {
    for (int j=0; j<yPt-1; j++) {

      mesh.addFace(pts[i][j], pts[i][j+1], pts[i+1][j]);
      mesh.addFace(pts[i][j+1], pts[i+1][j+1], pts[i+1][j]);
      
    }
  }
} // end buildMesh

void displayPts() {
  pushStyle();
  stroke(255);
  strokeWeight(3);
  for (int i=0; i< xPt; i++) {
    for (int j=0; j<yPt; j++) {

      point(pts[i][j].x, pts[i][j].y, pts[i][j].z);
    }
  }
  popStyle();
} // end displayPts

