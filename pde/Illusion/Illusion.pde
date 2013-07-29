int i, j, t=width/2, p=height/2, fade;
void setup() {
  size(800, 450);
  strokeWeight(2);
  background(255);
}

void draw() {
  background(255);
  translate(width/2, height/2);
  for (i=t; i<t+60; i+=3) {
    for (j=p; j<p+120; j+=3) {
      point (i-20, j-45);
      point (i+50, j-120);
      rotate(120+mouseX+mouseY);
    }
  }
}
