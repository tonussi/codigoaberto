Form vertical[], horizontal[];
float px, py;
PFont tarrafa;
int grid;

void setup() {
  size(940, 300);
  rectMode(CENTER);
  imageMode(CENTER);
  ellipseMode(CENTER);

  //smooth();
  
  grid = 55;
  
  vertical = new Form[grid];
  horizontal = new Form[grid];

  px = grid;
  py = grid;

  for (int i = 0; i < vertical.length; i++) {
    vertical[i] = new Form(px, py);
    horizontal[i] = new Form(px, py);

    if (px < width) {
      px += grid;
    } 
    else if (py < height) {
      px = grid;
      py += grid;
    }
    print(px + " ");
    print(py + " ");
  }
  background(color(224, 215, 165));

  //#e0d7a5
  //#16afd2
  //#fcd900
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
  }
}

