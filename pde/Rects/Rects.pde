/*
Author >>
Lucas Tonussi

Homepage >>
http://tonussi.github.com

Refs >>
http://processing.org/reference/line_.html
http://processingjs.org/reference/line_/
*/

float radius = 70.0;
int X, Y;
int nX, nY;
int delay = 16;
int mode = 0;

void setup(){
  smooth ();
  background (255);
  size (1280,720);
  strokeWeight (0.8);
  frameRate (25);
  X = width/2;
  Y = width/2;
  nX = X;
  nY = Y;
}

void draw() {
  if (mode == 0)
  {
    radius = radius + cos (frameCount/5);
    X+=(nX-X)/delay;
    Y+=(nY-Y)/delay;
    noFill ();
    stroke (#7F7F7F);
    rect (X,Y,radius,radius);
  }
}

void mouseMoved() {
  nX = mouseX+30;
  nY = mouseY+30;
}

void mousePressed () {
  mode++;
  mode %=1;
  background (255);
}
