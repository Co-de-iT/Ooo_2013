
/* 
 
 Oo° - Object Oriented Ornament
 P5 Co-de-iT workshop Cava dei Tirreni - 22>24 November 2013
 tutor: Alessio Erioli
 
 just a recap of the main code sytax
 
 DO NOT EXECUTE - USE AS REFERENCE
 
 */

// _____________________ variables

// primitives
int p=3;
float t=3.0;
String s = "Name";
boolean b = true;   

// classes type variables
PVector v;                     // declaration
v = new PVector(3.0, 2.5, 7.3);  // instantiation

// ArrayList
ArrayList arr = new ArrayList(); // generic ArrayList
// add element
arr.add(v);
// retrieve element
PVector v1 = (PVector) arr.get(0); // extracting element and casting

ArrayList <PVector> arr2 = new ArrayList<PVector>(); // flagged ArrayList
arr2.add(v);
v1 = arr2.get(0);

// Array 1 o 2 dimension
float[] num = new float[10];      // 1D array with 10 elements of index: 0,1,2,3,4,5,6,7,8,9
float[][] data = new float[5][3]; // 2D array 

// _____________________ function
void setup() {
  // function context
}
void draw() {
  // function context
}

// function declaration
int sum(int a, int b) {
  return a+b;
}
// function call
int c = sum(3, 4);

// _____________________ loops

for (int i=0; i<7; i++) {
}

int count = -1;

for (PVector y:arr2) {
  count++;
}

// _____________________ conditional statements

if (count<c) {
  // if true
}
else {
  // if false
}


// _____________________ classes

class Pippo{

  // class context
  
  // fields
  float size;
  PVector loc;
  
  // constructor(s)
  Pippo(PVector _loc, float _size){
    size = _size;
    loc = _loc;
  }
  
  // methods
  
  void move(){
    loc.add(new PVector(mouseX,mouseY));
  
  }
  
}


Pippo pi = new Pippo(v,5.76);
pi.move(); // method move of pi

