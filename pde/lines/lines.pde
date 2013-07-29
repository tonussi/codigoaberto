/*
Author >>
Lucas Tonussi

Homepage >>
http://tonussi.github.com

Refs >>
http://processingjs.org/reference/Array/
http://processingjs.org/reference/stroke_/
http://processingjs.org/reference/fill_/

Examples > Follow 2.
Based on code from Keith Peters (www.bit-101.com).

A two-segmented arm follows the cursor position. The relative
angle between the segments is calculated with atan2() and the
position calculated with sin() and cos().
*/


int n = 20;
int t = 0;
int p=1;
boolean stage = true;
float[] x = new float [n];
float[] y = new float [n];
float segLength = 50;

void setup () {
  strokeWeight (1.0);
  frameRate = 26;
  smooth ();
  background (255);
  size (1280, 720);

  for (int i = 0; i < n; i++) {
    x[i] = width/2;
    y[i] = height/2;
  }
}

void segment(float x, float y, float a) {
  pushMatrix();
  translate(x, y);
  rotate(a);
  line(0, 0, segLength, 0);
  popMatrix();
}

void dragSegment(int i, float xin, float yin) {
  float dx = xin - x[i];
  float dy = yin - y[i];
  float angle = atan2(dy, dx);
  x[i] = xin - cos(angle) * segLength;
  y[i] = yin - sin(angle) * segLength;
  segment(x[i], y[i], angle);
}

void draw() {
  dragSegment(0, mouseX, mouseY);
  dragSegment(1, x[0], y[0]);
  dragSegment(2, x[1], y[1]);
  dragSegment(3, x[2], y[2]);
  dragSegment(4, x[3], y[3]);
  dragSegment(5, x[4], y[4]);
  dragSegment(6, x[5], y[5]);
  dragSegment(7, x[6], y[6]);

  t ++;
  if (t>120) {
    fill (255,255,255,60);
    noStroke ();
    rect (0,0,width,height);
    t=0;
  }

  for (int i = 0; i < n; i ++) {
    if ((i>0) && (i < n)) {
      stroke (0,0,0,30);
      line (x[i],y[i],x[i-1],y[i-1]);
    }
    x[i] = x[i] + frameCount;
    y[i] = y[i] + frameCount;
    frameCount = 0;
  }
}
