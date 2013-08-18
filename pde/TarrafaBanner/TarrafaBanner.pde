Form vertical[], horizontal[];
float px, py;
PFont tarrafa;

void setup() {
  size(940, 200);
  rectMode(CENTER);
  //smooth();
  vertical = new Form[100];
  horizontal = new Form[100];

  px = -55;
  py = -55;

  for (int i = 0; i < vertical.length; i++) {
    vertical[i] = new Form(px, py);
    horizontal[i] = new Form(px, py);

    if (px < width - 55) {
      px += 55;
    } 
    else if (py < height - 55) {
      px = 55;
      py += 55;
    }
    print(px + " ");
    print(py + " ");
  }
  background(color(22, 175, 210));

  //#16AFD2
  //#FCD900
}

void mouseDragged() {
  for (int i = 0; i < vertical.length; i++) {
    vertical[i].desloca(vertical, mouseX, mouseY, 'v');
    horizontal[i].desloca(horizontal, mouseX, mouseY, 'h');
  }
}

void draw() {
  background(color(22, 175, 210));

  for (int i = 0; i < vertical.length; i++) {
    vertical[i].display('v');
    horizontal[i].display('h');
    vertical[i].ilumina(vertical, mouseX, mouseY, 'v');
    horizontal[i].ilumina(horizontal, mouseX, mouseY, 'h');
    vertical[i].colore(252, 217, 0, 5, 85);
    horizontal[i].colore(252, 217, 0, 5, 85);
  }
}

