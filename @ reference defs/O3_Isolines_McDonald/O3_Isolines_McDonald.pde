
int[] values;
int levels = 10;
float noiseScale = .001;
 
void setup() {
  size(640, 480, P2D); // 320x240
  smooth();
  values = new int[width * height];
  background(0);
  noiseDetail(6, .5);
}
 
void draw() {
  float offset = frameCount * .005;
   
  // first pass: compute values
  for(int y = 0; y < height; y++) {
    for(int x = 0; x < width; x++) {
      int i = y * width + x;
      values[i] = (int) (levels * noise(
        x * noiseScale,
        y * noiseScale,
        offset)); // converts noise in integers
    }
  }
   
  // second pass: check neighborhood
  loadPixels();
  for(int y = 1; y < height; y++) {
    for(int x = 1; x < width; x++) {
      int i = y * width + x;
      int center = values[i];
      if(
        center != values[i - 1] ||
        center != values[i - width])
        pixels[i] = 0xffffff; // pixel is white only if neighbours doesn't have the same value (finds thresholds)
    }
  }
  updatePixels();
   
  fill(0, 5);
  rect(0, 0, width, height);
}
