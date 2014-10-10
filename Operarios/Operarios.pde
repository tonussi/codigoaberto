Mover flower;
ArrayList<Mover> l;

void setup() {

  background(255);

  size(400, 400);

  l = new ArrayList<Mover>(100);

  for (int i = 0; i < 100; i++)
    l.add(new Mover(new PVector(random(0.15), random(-0.1, 1.2)), new PVector(random(width), random(height))));
}

void draw( ) {
  //background(255);

  for (Mover p : l) {
    p.go();
    for (Mover k : l) {
      p.collideEqualMass(k);
    }
  }
}

void keyPressed() {
  if (key == 's') {
    set(0, 0, get(0, 0, width, height));
    save("pics/frame-" + nf(frameCount, 4) + ".png");
  }
}
