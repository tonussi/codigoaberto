/*
Lucas Tonussi
http://tonussi.github.com
http://processingjs.org/reference/Array/
http://processingjs.org/reference/stroke_/
http://processingjs.org/reference/fill_/

Examples > Follow 2.
Based on code from Keith Peters (www.bit-101.com).

A two-segmented arm follows the cursor position. The relative
angle between the segments is calculated with atan2() and the
position calculated with sin() and cos().
*/


int n = 30;
int t = 0;
float[] x = new float [n];
float[] y = new float [n];
float segLength = 40;

void setup () {
  strokeWeight (1);
  smooth ();
  size (1280, 720);
  for (int i = 0; i < n; i++) { x[i] = width/2; y[i] = height/2; }
  background (255);
  stroke (random(110),random(150),random(120),random(0,50));
}

void segment (float x, float y, float a) {
  pushMatrix ();
  translate (x, y);
  rotate (a);
  line (0, 0, segLength, 0);
  popMatrix ();
}

void dragSegment(int i, float xin, float yin) {
  float dx = xin - x[i];
  float dy = yin - y[i];
  float angle = atan2 (dy, dx);
  x[i] = xin - cos (angle) * segLength;
  y[i] = yin - sin (angle) * segLength;
  segment (x[i], y[i], angle);
}

void draw() {
  if (mousePressed) {
    changeColor();
  }
}

void mouseMoved () {
  /*space for some math-formula*/
        float px = mouseX;
        float py = mouseY;
        dragSegment (0, px, py);
        dragSegment (1, x[0], y[0]);
        dragSegment (2, x[1], y[1]);
        dragSegment (3, x[2], y[2]);
        dragSegment (4, x[3], y[3]);
        dragSegment (5, x[4], y[4]);
}

void changeColor () {
  //background (255);
  stroke (random(110),random(150),random(120),random(0,50));
}
