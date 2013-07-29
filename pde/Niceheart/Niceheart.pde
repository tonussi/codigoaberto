/*
http://forum.processing.org/topic/shape-heart
http://www.mathematische-basteleien.de/heart.htm
http://processingjs.org/
http://processing.org
*/
import processing.opengl.*;
int blackout=0;
float x[] = new float[60];
float y[] = new float[60];
float rx = 0;
float ry = 0;
int change = 0;

void setup() {
  smooth ();
  background (0);
  size (1200, 720, OPENGL);
  noiseDetail(3);
  strokeWeight (1);
  stroke (224,36,36);
}

void draw() {
  if (mousePressed) {
    blackout++;
    if (blackout>2) {
      fill (0,0,0,30);
      rect (0,0,width,height);
      blackout=0;
    }
    noFill();
    heartnerd();
  }
}


void heartnerd () {
    float rxp = ((mouseX-(width/2))*0.005);
    float ryp = ((mouseY-(height/2))*0.005);
    translate (mouseX-25,mouseY-25);
    for (int p=0; p<60; p++) {
      x[p] = (0.10) * (-pow (p,2) + 40*p + 1200) * sin ((PI*p)/180);
      y[p] = -(0.10) * (-pow (p,2) + 40*p + 1200) * cos ((PI*p)/180);
      line (x[p],y[p],0,0);
      ellipse (x[p],y[p],random(-9,9),random(-9,9));
      line (-x[p],y[p],0,0);
      ellipse (-x[p],y[p],random(-9,9),random(-9,9));
    }
}
