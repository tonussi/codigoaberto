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

  background(40);
  smooth();

  // The font must be located in the sketch's 
  // "data" directory to load successfully
  font = loadFont("BPreplay.otf");
  textFont(font, 32);
  text("word", 10, 50);
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

void mouseClicked() {
  cx = mouseX;
  cy = mouseY;
  state++;
}

void draw() {
  background(40);

  grid.display();
  if (state == 1) {
    grid.updateGrid(cx, cy);
  }
  else if (state == 2) {
    grid.updateGrid(cx, cy);
  } 
  else {
    state = 0;
  }
}

