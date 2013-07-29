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

int el = 7;
int n = 24;
int whiteout = 0;
float[] x = new float [n];
float[] y = new float [n];
float segLength = 50;

void setup () {
  size         (1280, 720);
  strokeWeight (4);
  smooth       ();
  background   (#dbdbdb);

  int di = (int) random (720, 1280);

  for (int i = 0; i < n; i++) {
    x[i] = di/2;
    y[i] = di/2;
  }
  stroke (0, 0, 0, 40);
}

void draw () {
  if (mousePressed) {
    whiteout++;
    if (whiteout > 2) {
      fill (219, 219, 219, 40);
      rect (-10, -10, width+10, height+10);
      whiteout = 0;
    }

    /*
    here.. branch for some math formula
    */

    float px = mouseX;
    float py = mouseY;

    dragSegment (0, px, py);
    ellipse     (0, 0, el, el);

    for (int i=1 ; i<20 ; i++) {
      mouseMoved (i, x[i-1], y[i-1], x[i-1], y[i-1], el);
    }
  }
}

void mouseMoved (int a, float b, float c, float d, float e, float f) {
  dragSegment (a, b, c);
  ellipse     (d, e, f, f);
}

void segment (float x, float y, float a) {
  pushMatrix ();
  translate  (x, y);
  rotate     (a);
  line       (0, 0, segLength, 0);
  popMatrix  ();
}

void dragSegment (int i, float xin, float yin) {
  float dx    = xin - x[i];
  float dy    = yin - y[i];
  float angle = atan2 (dy, dx);
  x[i]        = xin - cos (angle) * segLength;
  y[i]        = yin - sin (angle) * segLength;
  segment (x[i], y[i], angle);
}
