Form vertical[], horizontal[];
float px, py, offSet;
PFont tarrafa;
int grid, foo, bar;
boolean drag, anima;

void setup() {
  size(940, 300);
  rectMode(CENTER);

  grid = 54;
  offSet = 15;

  vertical = new Form[grid];
  horizontal = new Form[grid];

  px = grid;
  py = grid;

  for (int i = 0; i < vertical.length; i++) {
    vertical[i] = new Form(px - offSet, py - offSet);
    horizontal[i] = new Form(px - offSet, py - offSet);

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

  background(color(22, 175, 210));
  tarrafa = loadFont("LiberationMono-48.vlw");
  textFont(tarrafa, 32);

  //#e0d7a5
  //#16afd2
  //#fcd900

  drag = false;
  anima = false;
}

void mouseDragged() {
  if (mousePressed) {
    for (int i = 0; i < vertical.length; i++) {
      vertical[i].desloca(vertical, mouseX, mouseY, 1);
      horizontal[i].desloca(horizontal, mouseX, mouseY, 1);
    }
  }
}

void draw() {
  //rectMode(CENTER);
  //background(color(22, 175, 210));

  for (int i = 0; i < vertical.length; i++) {
    vertical[i].display('v');
    horizontal[i].display('h');
  }

  foo = parseInt(random(0, vertical.length - 1));
  bar = parseInt(random(0, vertical.length - 1));

  animaV();
  animaH();
  animaF();

  if (drag == true) {
    animaSuave();
    reconstroi();
    animaTarrafa(); //T H C
    this.notifyAll();
  }
}

//    red = 252;
//    green = 217;
//    blue = 0;

synchronized void animaV() {
  if (random(1000) < 100)
    vertical[foo].colore(252, parseInt(random(170, 217)), 0, 100, 0, 0, 'b');
  else if (random(9000) < 100)
    horizontal[bar].colore(parseInt(random(20, 22)), parseInt(random(130, 175)), 210, 100, 0, 0, 'b');
}


void animaSuave() {
  //rectMode(0);
  background(color(22, 175, 210));
  //rect(0, 0, width, height);
}

void animaTarrafa() {
  vertical[4].colore(0, 0, 0, 100, 0, 0, 'b');
  horizontal[4].colore(0, 0, 0, 100, 0, 0, 'b');
  horizontal[22].colore(0, 0, 0, 100, 0, 0, 'b');

  horizontal[6].colore(0, 0, 0, 100, 0, 0, 'b');
  vertical[6].colore(0, 0, 0, 100, 0, 0, 'b');
  vertical[7].colore(0, 0, 0, 100, 0, 0, 'b');
  horizontal[7].colore(0, 0, 0, 100, 0, 0, 'b');
}

void reconstroi() {
  animaSuave();

  for (int i = 0; i < vertical.length; i++) {
    vertical[i].update(px - offSet, py - offSet);
    horizontal[i].update(px - offSet, py - offSet);

    if (px < width) {
      px += grid;
    } 
    else if (py < height) {
      px = grid;
      py += grid;
    }
  }
}

synchronized void animaH() {
  if (random(1000) < 150)
    horizontal[foo].colore(parseInt(random(120, 252)), 217, 0, 100, 0, 0, 'b');
  else if (random(9000) < 100)
    horizontal[bar].colore(parseInt(random(120, 22)), 175, parseInt(random(145, 210)), 100, 0, 0, 'b');
}

synchronized void animaF() {
  fill(color(0, 0, 0, 5));
  text("interface arquitetura", width - 430, height - 60);
  text("tarrafa hackerspace", width - 410, height - 20);
}

