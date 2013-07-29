/*
Lucas Tonussi
tonussi.github.com
*/

int whiteout = 0;
float x = 0;
float y = 0;
float changePx = 0;
float changePy = 0;

void setup () {
  size (1280, 720);
  background (255);
  smooth ();
  strokeWeight (3);
  changePx = width/2;
  changePy = height/2;
}

void draw() { }

boolean mouseMoved () {
  whiteout++;

  if (whiteout > 2) {
    background (255,255,255,40);
    whiteout = 0;
  }

  fill (random (0,255),random (0,255),random (0,255), 20);
  stroke (random (0,255),random (0,255),random (0,255), 20);

  x = mouseX - tan (random (360) * PI);
  y = mouseY - tan (random (360) * PI);

  line ( x   , y   , changePx , changePy );
  line ( x   , 2*y , changePx , changePy );
  line ( 2*x , y   , changePx , changePy );
  line ( 2*x , 2*y , changePx , changePy );
  rect ( x   , y   , x       , y        );

  if (mousePressed) {
     changePx = mouseX;
     changePy = mouseY;
  }
}
