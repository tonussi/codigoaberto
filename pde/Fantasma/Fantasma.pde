/*http://processingjs.org/
 http://processing.org
 pyro-grafitt
 Lucas Tonussi
 tonussi.github.com
 */
import java.awt.image.BufferedImage;
import java.awt.*;

PImage screenShot;


float x[] = new float[40];
float y[] = new float[40];
float px = 0;
float py = 0;
int change = 0;
int reset = 0;
int clear = 0;
int c;

void setup() {
  screenShot = getScreen();

  size (800, 450, P3D);
  background (255);
  smooth ();
  c = -100;
  strokeWeight (2);
  fill(0, 0, 0, 80);
  stroke(255, 255, 255, 80);
  //stroke ((int) random(100), (int) random(100), (int) random(100), 30);
}

void draw() {
  if (key == 's') { 
    save("picture1.png");  // whole screen of program
  }
}

void mouseMoved () {
  /*reset++;
  if (reset > 300) {
    stroke ((int) random(100),(int) random(100),(int) random(100), 30);
    c = 0;
    reset = 0;
  }*/
  c = (c+1)%200;

  float rxp = ((width/2)  - mouseX) * 0.005;
  float ryp = ((height/2) - mouseY) * 0.005;

  px = (c*0.3)+(rxp*0.1);
  py = (c*0.3)+(ryp*0.1);

  translate (mouseX, mouseY);

  for (int p=0; p<40; p++) {
    x[p] =  (0.25) * (-pow (p, 2) + 40*p + 200) * sin ((PI*p)/180);
    y[p] = -(0.25) * (-pow (p, 2) + 40*p + 200) * cos ((PI*p)/180);
    rect (x[p], y[p], px, py);
    rotateX (x[p]-rxp);
    rotateY (y[p]-ryp);
  }
  //image(screenShot, 0, 0, width, height);

}

PImage getScreen() {
  GraphicsEnvironment ge = GraphicsEnvironment.getLocalGraphicsEnvironment();
  GraphicsDevice[] gs = ge.getScreenDevices();
  DisplayMode mode = gs[0].getDisplayMode();
  Rectangle bounds = new Rectangle(0, 0, mode.getWidth(), mode.getHeight());
  BufferedImage desktop = new BufferedImage(mode.getWidth(), mode.getHeight(), BufferedImage.TYPE_INT_RGB);

  try {
    desktop = new Robot(gs[0]).createScreenCapture(bounds);
  }
  catch(AWTException e) {
    System.err.println("Screen capture failed.");
  }

  return (new PImage(desktop));
}

