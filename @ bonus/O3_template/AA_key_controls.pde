// keyboard functions

// all keyboard-based control are here

void keyPressed() {
  if (key == 'i') saveFrame("images/CS_template_####_"+amplitude+"_"+freq+".png");
  if (key =='g') guiDraw = !guiDraw;
  if (key == ' ') go = !go;
  if (key=='b') boxDraw = !boxDraw;
  if (key=='w')walk = !walk;
  if (key =='p') ptDraw = !ptDraw;
  if (key=='c') {
    col++;
    switch(col%5) {
    case 0: // pink & purple
      a = color(54, 12, 100);                 // color for gradient start
      mid = color(217, 187, 250);           // color for mid gradient
      b = color (255);                      // color for gradient end
      break;
    case 1: // black & white
      a = color(0);                 // color for gradient start
      mid = color(50);           // color for mid gradient
      b = color (255);                      // color for gradient end
      break;
    case 2: // random red
      a = color(random(255), 0, 0);                 // color for gradient start
      mid = color(random(255), 0, 0);           // color for mid gradient
      b = color(random(255), 0, 0);                      // color for gradient end
      break;
    case 3: // random blue
      a = color(0,0,random(255));                 // color for gradient start
      mid = color(0,0,random(255));            // color for mid gradient
      b = color(0,0,random(255));                       // color for gradient end
      break;
    case 4: // just random
      a = color(random(255), random(255), random(255));             // color for gradient start
      mid = color(random(255), random(255), random(255));           // color for mid gradient
      b = color(random(255), random(255), random(255));             // color for gradient end
      break;
    }
  }
}

