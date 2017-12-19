void c5_setup() {

  c5.setColorBackground(color(0, 0))
    .setColorForeground(color(120))
      .setColorActive(color(180));

  //            var   min  max  default   x   y  l   h
  c5.addSlider("amp", 0, 10, amp, 10, 10, 200, 10);
  c5.addSlider("freq", 1, 20, freq, 10, 30, 200, 10);
  c5.addSlider("ns", 1, 500, ns, 10, 50, 200, 10);
  c5.addSlider("ang", PI/6, 2*PI, ang, 10, 70, 200, 10);
  c5.addSlider("rad", 50, 300, rad, 10, 90, 200, 10);


  c5.addSlider("xPt", 50, 500, xPt, 10, 110, 200, 10);
  c5.addSlider("yPt", 50, 500, yPt, 10, 130, 200, 10);
}


void checkOverlap() {

  if (c5.isMouseOver()) {
    cam.setActive(false);
  }
  else {
    cam.setActive(true);
  }
}