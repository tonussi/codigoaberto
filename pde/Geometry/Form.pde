import processing.opengl.*;

/*
http://forum.processing.org/topic/shape-heart
http://www.mathematische-basteleien.de/heart.htm
http://processingjs.org/
http://processing.org
*/


float x[] = new float[60];
float y[] = new float[60];
float rx = 0;
float ry = 0;
int change = 0;

void setup() {
  smooth ();
  background (255);
  size (1200, 720, OPENGL);
  noiseDetail (3);
  strokeWeight (5);
  stroke (222,171,43,33);
}

void draw() {
  if (mousePressed) {
    form();
  }
}

void form () {
  float rxp = ((mouseX-(width/2))*0.005);
  float ryp = ((mouseY-(height/2))*0.005);
  float px = (frameCount*0.3)+(rxp*0.1);
  float py = (frameCount*0.3)+(ryp*0.1);
  translate (mouseX-25,mouseY-25);
  for (int p=0; p<60; p++) {
    x[p] = (0.25) * (-pow (p,2) + 40*p + 200) * sin ((PI*p)/180);
    y[p] = -(0.25) * (-pow (p,2) + 40*p + 200) * cos ((PI*p)/180);
    line (x[p],y[p],px,py);
    rotateX (x[p]-rxp);
    rotateY (y[p]-ryp);
  }
}
