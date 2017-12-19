class Ball {

  // fields

  Vec2D pos;

  // constructor(s)

  Ball (Vec2D _pos) {
    pos = _pos;
  }

  // expert use only!!!
  /*  Ball (Vec2D pos) {  
   this.pos = pos;    // 
   } */

  // methods
  
  void displayPoint() {
    pushStyle();
    //stroke(250+5*cos(frameCount/100));
    stroke(220, 20);
    strokeWeight(0.8);
    point(pos.x, pos.y);
    popStyle();
  }
  
    void moveNoise(float val) {
    /*pos.x += cos(val * TWO_PI*(2+6*cos(frameCount/100)))*0.25;
    pos.y += -sin(val * TWO_PI*(2+6*cos(frameCount/100)))*0.25;*/ // < spakka!!!!
    pos.x += cos(val * 6*TWO_PI*2)*0.25;
    pos.y += -sin(val * 6*TWO_PI*2)*0.25;
    
  }

  void wrap() {
    if (pos.x<0) {
      pos.x=width-1;
    }
    if (pos.x>=width) {
      pos.x=0;
    }
    if (pos.y<0){
    pos.y=height-1;
    }
    if(pos.y>=height){
    pos.y=0;
    }
  }

  
} // end class

