public class Form {

  protected float x, y, mmWidth, mmHeight, pixelWidth, pixelHeight, contourWeight;
  protected int spaceBanner, red, green, blue, weightFill, weightStroke;
  private PGraphics pgV, pgH;

  public Form (float x, float y) {
    this.x = x;
    this.y = y;

    mmWidth = 5f;
    pixelWidth = (mmWidth * 96f) / 25.4;
    mmHeight = 15f;
    pixelHeight = (mmHeight * 96f) / 25.4;

    pgV = createGraphics(5, 15);

    pgH = createGraphics(15, 5);

    red = 252;
    green = 217;
    blue = 0;
    contourWeight = 0.875;
    weightStroke = 100;
    weightFill = 100;

    initColors();
  }

  public void display(char op) {
    if (op == 'v') {
      pgV.beginDraw();

      colore(red, green, blue, weightFill, weightStroke, contourWeight, 'o');

      arc(x - 1.5 * pixelWidth, y, pixelWidth, pixelWidth, PI/2, 3*PI/2);
      rect(x, y, pixelHeight, pixelWidth);
      arc(x + 1.5 * pixelWidth, y, pixelWidth, pixelWidth, 3*PI/2, 5*PI/2);

      pgV.endDraw();
    }
    else if (op == 'h') {
      pgH.beginDraw();

      colore(red, green, blue, weightFill, weightStroke, contourWeight, 'o');

      arc(x, y - 1.5 * pixelWidth, pixelWidth, pixelWidth, PI, TWO_PI);
      rect(x, y, pixelWidth, pixelHeight);
      arc(x, y + 1.5 * pixelWidth, pixelWidth, pixelWidth, 0, PI);

      pgH.endDraw();
    }
  }

  public void update() {
  }

  public void ilumina(Form form[], float x, float y, char op) {
    //    if (op == 'v' && dist(this.x, this.y, x, y) < 15) {
    //      red = green = blue = parseInt(dist(this.x, this.y, x, y));
    //    }
    //    else if (op == 'h' && dist(this.x, this.y, x, y) < 15) {
    //      red = green = blue = parseInt(dist(this.x, this.y, x, y));
    //    } 
    //    else {
    //    }
  }

  public void colore(int red, int green, int blue, int weightFill, int weightStroke, float contourWeight, char op) {

    if (this.red != 252 ||
      this.green != 217 ||
      this.blue != 0 ||
      this.weightStroke != 5 ||
      this.weightFill != 85 ||
      this.contourWeight != contourWeight) {

      if (op == 'b') {

        this.red = red;
        this.green = green;
        this.blue = blue;
        this.weightStroke = weightStroke;
        this.weightFill = weightFill;
        this.contourWeight = contourWeight;

        fill(color(red, green, blue, weightFill));
        strokeWeight(contourWeight);
        stroke(color(red, green, blue, weightStroke));
      } 
      else {
        fill(color(red, green, blue, weightFill));
        noStroke();
      }
    }
    else {
      initColors();
    }
  }

  public void initColors() {
    if (parseInt(random(0, 2)) == 1) {
      this.colore(252, 217, 0, 100, 100, 2.5, 'b');
      //      red = 252;
      //      green = 217;
      //      blue = 0;
      //      weightStroke = 5;
      //      weightFill = 90;
    }
    else {
      this.colore(22, 175, 210, 100, 100, 0.5, 'o');
      //      red = 22;
      //      green = 175;
      //      blue = 210;
      //      weightStroke = 100;
      //      weightFill = 100;
    }
  }

  public void desloca(Form form[], int x, int y, char op) {
    if (op == 'v' && dist(this.x, this.y, x, y) < 15) {
      this.x = x;
      this.y = y;
    }
    else if (op == 'h' && dist(this.x, this.y, x, y) < 15) {
      this.x = x;
      this.y = y;
    }
    else {
    }

    frameRate(5);

    for (Form f : form) {
      f.x = (f.x + x)%width;
      f.y = (f.y + y)%height;
    }

    frameRate(15);
  }
}

