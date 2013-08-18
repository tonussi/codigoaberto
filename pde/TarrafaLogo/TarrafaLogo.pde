PFont font;
Grid grid;
int state = 0;
int cx, cy;


void setup() {
  //size(displayWidth, displayHeight);
  //size(displayWidth, displayHeight, P3D);

  size(600, 600);

  if (frame != null) {
    frame.setResizable(true);
  }

  grid = new Grid(600, 600, 12);


  textAlign(CENTER, CENTER);
  rectMode(CENTER);
  imageMode(CENTER);

  background(41);
  smooth();
}

//public int sketchWidth() {
//  return displayWidth;
//}
//
//public int sketchHeight() {
//  return displayHeight;
//}
//
//public String sketchRenderer() {
//  return P3D;
//}

//boolean sketchFullScreen() {
//  return true;
//}

void mouseMoved() {
  cx = mouseX;
  cy = mouseY;
  grid.updateGrid(cx, cy);
}

void draw() {
  background(41);
  grid.display();
}

