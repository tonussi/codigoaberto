/*
Lucas Tonussi
http://tonussi.github.com/
*/

float radius = 70.0;
PFont f;

void setup() {
  size (1280, 720);
  smooth ();
  background (255);
  f = createFont("FreeMono",36,true);
}

void draw() {
  if (mousePressed) {
    float x = mouseX;
    float y = mouseY;
    mouseMoved (mousePressed, x, y);
  } else {
    //...
  }
}

void mouseMoved (boolean foo, float x, float y) {
  if (foo == true) {
    fill (0,0,0, random (20,80));
    stroke (0,0,0);
    strokeWeight (random(1,5));
    radius = tan (((int) (random(180)*PI))/5);
    textFont (f, random (8,16));
    text ("\n"+radius+"", mouseX, mouseY);
    translate (mouseX, mouseY);
    ellipse (random(16,26), random(16,26), radius, radius);
  } else {
    //...
  }
}
