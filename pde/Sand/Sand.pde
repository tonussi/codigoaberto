//creativeoffice
import processing.opengl.*;

float rx = 0;
float ry = 0;
int change = 0;
float radio = 0;

void setup() {
  smooth ();
  background (0);
  size (1200, 720, OPENGL);
  radio = height/3.5;
  noiseDetail(3);
  strokeWeight (5);
}

void draw() {
  sand();
  if (keyPressed) {
    stroke (84,234,71,30);
  } else {
    stroke (255,255,255,30);
  }
}
