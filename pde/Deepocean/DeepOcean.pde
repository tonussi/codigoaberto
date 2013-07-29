/*
http://forum.processing.org/topic/shape-heart
http://www.mathematische-basteleien.de/heart.htm
http://processingjs.org/
http://processing.org
*/

int blackout = 0;
float x[] = new float[61];
float y[] = new float[61];
float rx = 0;
float ry = 0;
int change = 0;

void setup() {
  smooth ();
  background (255);
  size (900, 720);
  //noiseDetail(15);
  strokeWeight (5);
  stroke (35,31,111,20);
}

void draw() {
  blackout++;
  if (blackout>3){
    fill (255,250,255,30);
    rect (0,0,width,height);
    blackout = 0;
  }
  
  if (mousePressed) {
    form();
  }
}

void form () {
  float rxp = ((mouseX-(width/2))*0.005);
  float ryp = ((mouseY-(height/2))*0.005);
  //float px = (frameCount*0.3)+(rxp*0.1);
  //float py = (frameCount*0.3)+(ryp*0.1);
  translate (mouseX-25,mouseY-25);
  for (int p=0; p<=60; p++) {
    x[p] =  (.1) * (-pow (p,2) + 40*p + 1200) * sin ((PI*p)/180);
    y[p] = -(.1) * (-pow (p,2) + 40*p + 1200) * cos ((PI*p)/180);
    line ( x[p] , y[p] , 0, 0);
    line (-x[p] , y[p] , 0, 0);
  }
}
