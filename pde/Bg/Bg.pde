/**
 * Background Image. 
 * 
 * This example presents the fastest way to load a background image
 * into Processing. To load an image as the background, it must be
 * the same width and height as the program.
 */

// The next line is needed if running in JavaScript Mode with Processing.js
/* @pjs preload="moonwalk.jpg"; */

PImage bg;
int x, y, c, g, m, n, size=120;

void setup() {
  size(434, 514);
  // The background image must be the same size as the parameters
  // into the size() method. In this program, the size of the image
  // is 650 x 360 pixels.
  bg = loadImage("urso.jpg");
  imageMode(CENTER);
  noStroke();
}

void draw() {
  background(255);
  mouseMoved();
}

void mouseMoved () {
  stroke (random (100), random (100), random (100), 30);

  //x = int(mouseX - tan (random (360) * PI));
  //y = int(mouseY - tan (random (360) * PI));

  x = parseInt(random(width));
  y = parseInt(random(height));

  line (width/2, height/2, x, y); //center to v1
  line (width/2, height/2, x+size, y); //center to v2
  line (width/2, height/2, x, y+size); //center to v3
  line (width/2, height/2, x+size, y+size); //center to v4


  PImage lesser = bg.get (x, y, size, size);
  image (lesser, x+(size/2), y+(size/2));
}
