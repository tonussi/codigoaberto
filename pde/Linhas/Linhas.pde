float spot[], x, y, px, py, pi, p;
int r, g, b;

boolean init;

void setup() {
  size(800, 450);

  spot = new float[width];

  for (int i = 0; i < spot.length; i+=1)
    spot[i] = i;

  y = change();

  init = false;

  x = 0;
  r = 50;
  g = 120;
  b = 200;
  p = 0.5;

  noFill();
  noStroke();
  strokeWeight(0.1);
  smooth();
  background(41);
}


synchronized void lin() {
  stroke(color(r, g, b, random(25, 49)));
  strokeWeight(p);
  x += .2 + random(0, 1);
  line(y, x, y + random(-45, 0), x);
  if (random(8000) < 100)
    y = change();
}

synchronized void lin2() {
  stroke(color(r, g, b, random(25, 49)));
  strokeWeight(p);
  x += .2 + random(0, 1);
  line(y, x, y + random(45), x);
  if (random(8000) < 100)
    y = change();
}

float change() {
  if (x > height)
    x = 0;
  return spot[parseInt(random(width)) % spot.length];
}

void mouseClicked() {
  init = !init;
}

void keyPressed() {
  if (key == 'q')
    r++;
  else if (key == 'a')
    r--;
  else if (key == 'w')
    g++;
  else if (key == 's')
    g--;
  else if (key == 'e')
    b++;
  else if (key == 'd')
    b--;
  else if (key == 'r')
    p+=0.1;
  else if (key == 'f')
    p-=0.1;
  p = (p < 0 || p > 1)? 0.1 : p ;
}

void draw() {
  if (init) {
    lin();
    lin2();
  }
}

