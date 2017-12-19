/** @peep sketchcode */

// from: http://peepproject.com/tutorials/tutorial/25/view
 
 int nCir = 100;
Circle[] circles = new Circle[100]; // A variable to hold an instance of the Circle class

 
void setup() {
  size(300, 300);
  frameRate(10);
  smooth();
  // Construct an instance of the Circle class at the centre of the sketch
  for (int i=0; i<circles.length; i++){
  circles[i] = new Circle(random(width), random(height), random(width/8.0));
  
  }
}
 
void draw() {
  background(255);
  for (int i=0; i<circles.length; i++)
  {circles[i].update(); // Have the circle draw itself on screen
  circles[i].draw();
  }
}
 
class Circle {
  float x;
  float y;
  float radius;
 
  Circle(float _x, float _y, float _radius) {
    x = _x;
    y = _y;
    radius = _radius;
  }
  
    void update() {
    x += random(-1, 1);
    y += random(-1, 1);
  }
 
  void draw() {
    pushStyle(); // Remember current drawing style
    noFill(); // Remove fill for circle
    stroke(0); // Set the stroke colour to black
    strokeWeight(1); // Set the stroke weight to 1 pixel
    pushMatrix(); // Remember current drawing transformation
    translate(x, y); // Translate to the position of the circle
    ellipseMode(RADIUS); // Set the ellipse drawing mode using radius
    ellipse(0, 0, radius, radius); // Draw the circle
    popMatrix(); // Restore previous drawing transformation
    popStyle(); // Restore previous drawing style
  }
}