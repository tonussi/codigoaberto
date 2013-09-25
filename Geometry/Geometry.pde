/*
http://forum.processing.org/topic/shape-heart
 http://www.mathematische-basteleien.de/heart.htm
 http://processingjs.org/
 http://processing.org
 */


float x[], y[], rx, ry;
int change;

void setup() {
  size (800, 450);

  x = new float[60];
  y = new float[60];
  rx = 0;
  ry = 0;
  change = 0;

  stroke(color(255, 255, 255, 40));
  background(color(41, 41, 41, 40));
}

void draw() {
  background(color(41, 41, 41, 40));

  if (mousePressed) {
    form();
  }


}

void form () {
  float rxp = ((mouseX-(width/2))*0.005);
  float ryp = ((mouseY-(height/2))*0.005);
  float px = (frameCount*0.3)+(rxp*0.1);
  float py = (frameCount*0.3)+(ryp*0.1);
  translate (mouseX-25, mouseY-25);

  for (int p=0; p<60; p++) {
    x[p] = (0.25) * (-pow (p, 2) + 40*p + 200) * sin ((PI*p)/180);
    y[p] = -(0.25) * (-pow (p, 2) + 40*p + 200) * cos ((PI*p)/180);
    line (x[p], y[p], px, py);
    rotate (x[p]-rxp);
    rotate (y[p]-ryp);
  }

}

