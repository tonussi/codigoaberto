int fade, op;
float change, rxp, ryp, px, py;

void setup() {
  size (800, 1000);
  op = 1;
  change = 3;
  background(255);
  stroke(41);
  strokeWeight(1);
}

void keyPressed() {
  if (key == 'q') {
    stroke(color(random(255), random(155), random(155)));
  }
  if (key == 'w') {
    fill(255, 80);
    rect(0, 0, width, height);
    stroke(41);
  }
  if (key == 'e') {
    fill(41, 80);
    rect(0, 0, width, height);
    stroke(255);
  }
  if (key == 'r') {
    rxp = ((mouseX-(width/2))*0.005);
    ryp = ((mouseY-(height/2))*0.005);
  }
  else {
    rxp = ryp = 0;
  }
  if (key == 't') {
    px = (frameCount*0.3)+(rxp*0.1);
    py = (frameCount*0.3)+(ryp*0.1);
    if (frameCount > 200)
      frameCount = 0;
  }
  if (key == 'y') {
    change+=3;
    if (change > 15)
      change = 3;
  }
}

void draw() {
  if (mousePressed) {
    form();
  }
}

void form() {
  translate (mouseX, mouseY);
  for (float i=0; i<60; i+=change) {
    for (float j=0; j<60; j+=change) {
      point (rxp+i-20, ryp+j-45);
      point (px+i+50, py+j-120-rxp);
      rotate(120-(mouseX/2)+(mouseY/2));
    }
  }
}
