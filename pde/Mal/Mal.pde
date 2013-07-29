/*
Lucas Tonussi
http://tonussi.github.com

http://processingjs.org/reference/Array/
http://processingjs.org/reference/stroke_/
http://processingjs.org/reference/fill_/
*/

int cto = 3;
int reset = 0;
int n = 14;
int whiteout = 0;
float[] rx = new float[n];
float[] ry = new float[n];

void setup () {
  size (1280, 720);
  background (255);
  for (int i=0; i<n; i++) {
    rx[i] = width/2;
    ry[i] = height/2;
  }
}

void draw () {
  reset++;
  if (reset >= 1255) {
    background (255);
    for (int i=0; i<n; i++) {
      rx[i] = width/2;
      ry[i] = height/2;
    }
    reset = 0;
  }

  if (whiteout >= 20) {
    fill (255,255,255,20);
    rect (-10,-10,width+10,height+10);
    whiteout = 0;
  }

  for (int i=1;i<n;i++) {
    if (mousePressed) {
      rx[(int) random (0,n-1)] = mouseX;
      ry[(int) random (0,n-1)] = mouseY;
    } else {
      rx[(int) random (0,n-1)] -= random (-cto,cto);
      ry[(int) random (0,n-1)] -= random (-cto,cto);
    }
    line (rx[i-1],ry[i-1],rx[(int) random (0,n-1)],ry[(int) random (0,n-1)]);
  }
}
