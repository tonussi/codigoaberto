/*
//name lucas pagotto tonussi
//license creativecommons
//site tonussi.github.com

refs
http://processingjs.org/reference/Array/
http://processingjs.org/reference/stroke_/
http://processingjs.org/reference/fill_/
*/

int n = 30;
int grayout = 0;
float[] nX = new float [n];
float[] nY = new float [n];
float[] rX = new float [n];
float[] rY = new float [n];

float segLength = 20;

void setup () {
  size (1280, 720);
  strokeWeight (3);
  smooth ();
  stroke ((int) random (0,200),(int) random (0,200),(int) random (0,200),30);
  background (224);

  int reloc = random (720,1280);
  for (int i = 0; i < n; i++) {
    nX[i] = reloc;
    nY[i] = reloc;
  }

  for (int i = 0; i < n; i++) {
    rX[i] = reloc/2;
    rY[i] = reloc/2;
  }
}

void segment(float x, float y, float a) {
  pushMatrix ();
  translate (x, y);
  rotate (a);
  line (0, 0, segLength, 0);
  popMatrix ();
}

void dragSegment(int i, float xin, float yin) {
  float dx = xin - rX[i];
  float dy = yin - rY[i];
  float angle = atan2(dy, dx);
  rX[i] = xin - cos(angle) * segLength;
  rY[i] = yin - sin(angle) * segLength;
  segment(rX[i], rY[i], angle);
}
void draw() {
  if (mousePressed) {
    stroke ((int) random (0,200),(int) random (0,200),(int) random (0,200),30);
  }
}

void mouseMoved() {
  dragSegment(1, rX[0], rY[0]);
  dragSegment(2, rX[1], rY[1]);
  dragSegment(3, rX[2], rY[2]);
  dragSegment(4, nX[3], nY[3]);
  dragSegment(5, nX[4], nY[4]);
  dragSegment(6, nX[5], nY[5]);

  grayout ++;
  if (grayout>2) {
    fill (224,224,224,40);
    rect (-10,-10,width+10,height+10);
    grayout=0;
  }

  for (int i = 0; i < n; i ++) {

    if ((i>0) && (i < n)) {
      line (rX[i],rY[i],rX[i-1],rY[i-1]);
    }

    nX[i] = nX[i] + ((int) random(-40,40));
    nY[i] = nY[i] + ((int) random(-40,40));
    rX[i] = nX[i] + cos ((int) random(260) * PI);
    rY[i] = nY[i] + sin ((int) random(260) * PI);

    if (nX[i] < 0 || nX[i] > width) {
      nX[i] = (int) random (0, width);
    }
    if (nY[i] < 0 || nY[i] > height) {
      nY[i] = (int) random (0, height);
    }
    if (rX[i] < 0 || rX[i] > width) {
      rX[i] = (int) random (0, width);
    }
    if (rY[i] < 0 || rY[i] > height){
      rY[i] = (int) random (0, height);
    }
  }
}
