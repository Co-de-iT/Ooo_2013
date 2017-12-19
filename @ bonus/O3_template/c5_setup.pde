// setup sliders & interface elements

void c5_setup() {
  
  // custom settings for interface //////////////////////////////////////////////////////
  c5.setColorBackground(color(120));
  c5.setColorForeground(color(60));
  c5.setColorActive(color(180));

  c5.addSlider("amplitude", 0, 20, 5, 10, 10, 200, 10);
  c5.addSlider("freq", 1, 20, 5, 10, 30, 200, 10);
  c5.addSlider("noiseSpeed", 10, 200, noiseSpeed, 10, 50, 200, 10);
  c5.addSlider("guiAlpha", 0, 200, guiAlpha, 10, 70, 200, 10);

  Slider s1 = (Slider)c5.controller("amplitude");
  Slider s2 = (Slider)c5.controller("freq");
  Slider s3 = (Slider)c5.controller("guiAlpha");
  Slider s4 = (Slider)c5.controller("noiseSpeed");

  myLabelA = c5.addTextlabel("label")
    .setText("")
      .setPosition(10, 100)
        .setColorValue(color(200));
}


//  ________________________________ ControlP5 in GUI FUNCTIONS

void checkOverlap() { // useful when interface is overlayed on main window - not used with external panel 

  // IMPORTANT!!!!///////////////////////////////////////////////
  // avoid rotation by mouse drag when using sliders of ControlP5
  //
  if (c5.window(this).isMouseOver()) {  // if mouse is over controllers
    cam.setActive(false);               // disable camera mouse controls
  }  
  else {                                // otherwise....
    cam.setActive(true);                // ...way to go!
  }
}

