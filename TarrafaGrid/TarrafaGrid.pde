/* @pjs preload="logo-180total.png"; */

Form vertical[], horizontal[];
PImage tarrafaImageLogo;

void setup() {
  size(940, 185); //958, 270
  rectMode(CENTER);
  imageMode(CENTER);
  frameRate(10); //20
  setGrid();
  tarrafaImageLogo = loadImage("logo-180total.png");
  background(255);
}

void setGrid() {
  float px, py, offSetX, offSetY, gridH, gridV;

  gridV = 37.795275591; //54

  vertical = new Form[69]; //64

  offSetX = -18.897637795; //-21
  offSetY = 1; //1
  px = py = gridV;

  for (int i = 0; i < vertical.length; i++) {
    vertical[i] = new Form(px - offSetX, py - offSetY);

    if (px < width - 2*gridV) {
      px += gridV;
    }
    else if (py < height) {
      px = gridV;
      py += gridV;
    }
    print(px + " ");
    print(py + " ");
  }

  gridH = 37.795275591; //54

  horizontal = new Form[48]; //51

  offSetX = 1; //6
  offSetY = -18.897637795; //-25.5
  px = py = gridH;

  for (int i = 0; i < horizontal.length; i++) {
    horizontal[i] = new Form(px - offSetX, py - offSetY);

    if (px < width - gridV) {
      px += gridH;
    }
    else if (py < height) {
      px = gridH;
      py += gridH;
    }
    print(px + " ");
    print(py + " ");
  }
}

void draw() {
  background(255);

  for (int i = 0; i < vertical.length; i++)
    vertical[i].display('v');

  for (int i = 0; i < horizontal.length; i++)
    horizontal[i].display('h');

  animaV();
  animaH();
  animaTarrafaImage();
}

void animaV() {
  int foo = parseInt(random(0, vertical.length - 1));

  if (random(1) < .5)
    vertical[foo].colore(201, 201, 201, 50, 0, 0, 'n');
  else if (random(1) < .8)
    vertical[foo].colore(252, 217, 0, 100, 0, 0, 'n');
  else if (random(1) < .3)
    vertical[foo].colore(255, 255, 255, 0, 0, 0, 'n');
  else if (random(1) < .7)
    vertical[foo].colore(22, 175, 210, 100, 0, 0, 'n');
}

void animaH() {
  int bar = parseInt(random(0, horizontal.length - 1));

  if (random(1) < .3)
    horizontal[bar].colore(201, 201, 201, 50, 0, 0, 'n');
  else if (random(1) < .7)
    horizontal[bar].colore(22, 175, 210, 100, 0, 0, 'n');
  else if (random(1) < .3)
    horizontal[bar].colore(255, 255, 255, 0, 0, 0, 'n');
  else if (random(1) < .6)
    horizontal[bar].colore(252, 217, 0, 100, 0, 0, 'n');
}

void animaTarrafaImage() {
  image(tarrafaImageLogo, 75, 90);
}

void mouseMoved() {
  for (int i = 0; i < vertical.length; i++)
    vertical[i].coloreOnMouseOver(mouseX, mouseY);

  for (int i = 0; i < horizontal.length; i++)
    horizontal[i].coloreOnMouseOver(mouseX, mouseY);
}


class Form {
  private float x, y, mmWidth, mmHeight, pixelWidth, pixelHeight, contourWeight;
  private int spaceBanner, red, green, blue, weightFill, weightStroke;
  private PGraphics pgV, pgH;
  private char opContour;

  Form (float x, float y) {
    this.x = x;
    this.y = y;
    mmWidth = 5f;
    pixelWidth = (mmWidth * 96f) / 25.4;
    mmHeight = 10f;
    pixelHeight = (mmHeight * 96f) / 25.4;
    pgV = createGraphics(5, 10);
    pgH = createGraphics(10, 5);
    this.opContour = 'n';
    initColors();
  }

  void display(char op) {
    colore(red, green, blue, weightFill, weightStroke, contourWeight, opContour);

    if (op == 'h') {
      pgV.beginDraw();
      arc(x - 1.0
        * pixelWidth, y, pixelWidth, pixelWidth, PI/2, 3*PI/2);
      rect(x, y, pixelHeight, pixelWidth);
      arc(x + 1.0
        * pixelWidth, y, pixelWidth, pixelWidth, 3*PI/2, 5*PI/2);
      pgV.endDraw();
    }
    else if (op == 'v') {
      pgH.beginDraw();
      arc(x, y - 1.0
        * pixelWidth, pixelWidth, pixelWidth, PI, TWO_PI);
      rect(x, y, pixelWidth, pixelHeight);
      arc(x, y + 1.0
        * pixelWidth, pixelWidth, pixelWidth, 0, PI);
      pgH.endDraw();
    }
  }

  void update(float x, float y) {
    this.x = x;
    this.y = y;
  }

  void colore(int red, int green, int blue, int weightFill, int weightStroke, float contourWeight, char opContour) {
    this.red = red;
    this.green = green;
    this.blue = blue;
    this.weightFill = weightFill;
    this.weightStroke = weightStroke;
    this.contourWeight = contourWeight;
    //this.opContour = opContour;

    strokeWeight(contourWeight);
    fill(color(red, green, blue, weightFill));

    if (opContour == 'y')
      stroke(color(0, 0, 0, weightStroke));
    else if (opContour == 'n')
      noStroke();
  }

  void initColors() {
    red = green = blue = 201;
    contourWeight = 0;
    weightStroke = 0;
    weightFill = 50;
  }

  void coloreOnMouseOver(int x, int y) {
    if (dist(this.x, this.y, x, y) < 10)
      colore(0, 0, parseInt(random(255)), parseInt(random(100)), 0, 0, 'n');
  }
}

void keyPressed() {
  if (key == 's') {
    saveFrame("data/pics/tarrafa-######.png");
  }
}
