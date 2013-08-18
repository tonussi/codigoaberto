public class Form {

  protected float x, y, mmWidth, mmHeight, pixelWidth, pixelHeight;
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

    initColors();
  }

  public void display(char op) {
    if (op == 'v') {
      pgV.beginDraw();
      colore(red, green, blue, weightFill, weightStroke);
      arc(x - 1.5 * pixelWidth, y, pixelWidth, pixelWidth, PI/2, 3*PI/2);
      colore(red, green, blue, weightFill, weightStroke);
      rect(x, y, pixelHeight, pixelWidth);
      colore(red, green, blue, weightFill, weightStroke);
      arc(x + 1.5 * pixelWidth, y, pixelWidth, pixelWidth, 3*PI/2, 5*PI/2);
      pgV.endDraw();
    }
    else if (op == 'h') {
      pgH.beginDraw();
      colore(red, green, blue, weightFill, weightStroke);
      arc(x, y - 1.5 * pixelWidth, pixelWidth, pixelWidth, PI, TWO_PI);
      colore(red, green, blue, weightFill, weightStroke);
      rect(x, y, pixelWidth, pixelHeight);
      colore(red, green, blue, weightFill, weightStroke);
      arc(x, y + 1.5 * pixelWidth, pixelWidth, pixelWidth, 0, PI);
      pgH.endDraw();
    }
  }

  public void update() {
  }

  public void ilumina(Form form[], float x, float y, char op) {
    if (op == 'v' && dist(this.x, this.y, x, y) < 15) {
      red = green = blue = parseInt(dist(this.x, this.y, x, y));
    }
    else if (op == 'h' && dist(this.x, this.y, x, y) < 15) {
      red = green = blue = parseInt(dist(this.x, this.y, x, y));
    } 
    else {
    }
  }

  public void colore(int red, int green, int blue, int weightFill, int weightStroke) {
    //stroke(color(red, green, blue, weightStroke));
    if (this.red != 252 || this.green != 217 || this.blue != 0 || this.weightStroke != 5 || this.weightFill != 85) {
      this.red = red;
      this.green = green;
      this.blue = blue;
      this.weightStroke = weightStroke;
      this.weightFill = weightFill;
      noStroke();
      fill(color(red, green, blue, weightFill));
    } 
    else {
      initColors();
    }
  }

  public void initColors() {
    red = 252;
    green = 217;
    blue = 0;
    weightStroke = 5;
    weightFill = 85;
    noStroke();
    fill(color(red, green, blue, weightFill));
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

