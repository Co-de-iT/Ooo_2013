// declare used classes
PeasyCam cam;                // camera
ControlP5 c5;                // GUI for controllers
PMatrix3D currCameraMatrix;  // camera matrix for overlay will be stored here
Textlabel myLabelA;

// global color variables
color bgCol = color(200);    // global background color
color sCol = color(255, 200);  // stroke color
color fCol = color(255, 220); // fill color
color txtCol = color(255); // text fill color
color a = color(54,12,100);                 // color for gradient start
color mid = color(217, 187, 250);           // color for mid gradient
color b = color (255);                      // color for gradient end
PImage logo;          // images for background & logo


// declare general variables
boolean go = false;
boolean guiDraw = true;
boolean boxDraw = true;
boolean ptDraw = true;
float guiAlpha = 80;
float alphaMult = 0;

// World parameters

World w;

// walkers
int nWks = 20;
boolean walk = false;


float amplitude = 5;         // amplitude
float freq = 5;             // frequency | try to declare freq as an int to see the effect!
float noiseScale;
float noiseInc = 0;
float noiseSpeed = 50;
float xSize = 500;           // size in x direction
float ySize = 200;           // size in y direction
int col=0;                   // var for color switching
int nFr=0;
int xPt=200;                 // n. of points in x direction //400
int yPt=80;                 // n. of points in y direction //160
int scrX = 1280;              // screen size in x
int scrY = 720;              // screen size in y
int guiWidth = 320;           // widt of GUI on screen left
// uncomment these for full screen (remember to start with "present" or CTRL+SHIFT+R)
//int scrX = screen.width;              // screen size in x
//int scrY = screen.height;              // screen size in y


