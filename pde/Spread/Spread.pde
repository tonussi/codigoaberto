/*
Author >>
Lucas Tonussi

Homepage >>
http://tonussi.github.com

Refs >>
http://processingjs.org/reference/Array/
http://processingjs.org/reference/stroke_/
http://processingjs.org/reference/fill_/
*/

int c0 = 0;
int c1 = 0;
int n = 30;
int t = 0;
float k = 0;
float l = 0;
int drawmode = 0;
boolean stage = true;
int[] nX = new int[n];
int[] nY = new int[n];
int[] rX = new int [n];
int[] rY = new int [n];

void setup () {
  strokeWeight (2.2);
  smooth ();
  background (255);
  size (1280, 720);

  for (int i = 0; i < n; i++) {
    nX[i] = width/2;
    nY[i] = height/2;
  }

  for (int i = 0; i < n; i++) {
    rX[i] = width/2;
    rY[i] = height/2;
  }

}

void draw() {
  t ++;
  if (t>104) {
    fill (255,255,255,60);
    noStroke ();
    rect (0,0,width,height);
    t=0;
  }


  c0++;
  if (c0>1500) {
    c0=0;
  }
  for (int i = 0; i < n; i ++) {
    if ((i>0) && (i < n)) {
      stroke (10,10,10,20);
      line (rX[i],rY[i],rX[i-1],rY[i-1]);
    }
    nX[i] = nX[i] + int (random(-6,6));
    nY[i] = nY[i] + int (random(-6,6));
    rX[i] = rX[i] + int (random(-9,9));
    rY[i] = rY[i] + int (random(-9,9));

    if (((l*k)%60) < 10) {
      if (nX[i]<0 || nX[i] > width) {
        nX[i] = (int) random (0, width);
      }
      if (nY[i]<0 || nY[i] > height) {
        nY[i] = (int) random (0, height);
      }
    } else {
      if (rX[i]<0 || rX[i] > width) {
        rX[i] = (int) random (0, width);
      }
      if (rY[i]<0 || rY[i] > height){
        rY[i] = (int) random (0, height);
      }
    }

    if (((k*l)%20) > 10) {
      fill (10,10,10,70);
    } else {
      fill (255,255,255,70);
    }

    k = (int) random (0,10);
    k = (int) random (0,10);
  }
}
