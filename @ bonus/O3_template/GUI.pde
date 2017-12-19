// draw GUI as separate function
//
// these commands could be in the draw() as well
// but sometimes it's better to separate things in chunks
// to have a clearer code to read
//

void gui() {

  float d = (float)cam.getDistance();                                  // 1. get some camera data
  float[] pos = cam.getLookAt();
  String tPos = ". target position: x."+pos[0]+" | y."+pos[1]+" | z."+pos[2];
  
  cam.beginHUD();                               // 2. resets camera to 2D plan view

  fade(0.1);                          // 2.1 a rectangle appears to ease interface reading - 

  image(logo, width-120, height-80);                                        // 3. draws the logo(s)

  c5.draw();                                         // 4. draws 2D ControlP5 interface

  pushStyle();
  textSize(10);                                                        //    and some text as well...
  stroke(txtCol);
  strokeWeight(0.5);
  fill(200);                                                        //    (draw anything 2D here)
  myLabelA.setValue(". noise time inc: "+str(nFr));

  line(10, 130, guiWidth-10, 130);

  text(". keyboard controls", 10, 155);
  text(". SPACE: toggle noise animation", 10, 180);
  text(". w: toggle walkers", 10, 205);
  text(". b: toggle box", 10, 230);
  text(". c: cycle color styles", 10, 255);
  text(". g: toggle GUI", 10, 280);
  text(". i: save image", 10, 305);

  text(". // Co-de-iT OoO workshop", 10, height-100);
  fill(txtCol);
  stroke(txtCol);
  strokeWeight(0.5);
  line(10, height-85, guiWidth-10, height-85);
  text(". camera current distance: "+ round(d), 10, height-65);                //    like.. how about some cam data?
  text(tPos, 10, height-50);                                                 //
  text(". PeasyCam mouse controls:", 10, height-35);                           //
  text(". left - orbit | middle - drag | right/wheel - zoom", 10, height-20);  //
  popStyle();
  cam.endHUD();                                      // 5. restores current camera matrix
}


/////////

// fade function

void fade(float speed){
 if (mouseX<guiWidth) { 
    alphaMult+=speed;
    if (alphaMult > 1) alphaMult =1;
  } 
  else {
    alphaMult-=speed;
    if (alphaMult<0) alphaMult=0;
  }
  if (guiAlpha*alphaMult>0){
  pushStyle();
  fill(80, guiAlpha*alphaMult);
  noStroke();
  rect(0, 0, guiWidth, height);
  popStyle();
  }

}

