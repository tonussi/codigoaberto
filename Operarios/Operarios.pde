import ddf.minim.*;
import ddf.minim.analysis.*;

Minim minim;
AudioPlayer song;
BeatDetect beat;
BeatListener b1;
float kicksize, snaresize, hatsize;

ArrayList<Mover> l;
Mover v, k;
int t, POPULATION;

void setup() {
  minim = new Minim(this);

  background(#00FF00);
  //background(#ffffff);

  POPULATION = 160;

  size(1200, 600);

  l = new ArrayList<Mover>();
  
  int height2 = height;
  int width2 = width;

  for (int i = 0; i < POPULATION; i++) {
    l.add(new Mover(new PVector(random(-0.5, 0.5), random(-0.5, 0.5)), new PVector(random(width2), random(height2))));
  }

  song = minim.loadFile("darkambient.mp3", 2048);
  song.play();

  beat = new BeatDetect(song.bufferSize(), song.sampleRate());

  beat.setSensitivity(50);
  kicksize = snaresize = hatsize = 16;

  b1 = new BeatListener(beat, song);
  textFont(createFont("Helvetica", 16));
  textAlign(CENTER);
}

void draw() {
  background(0x2c);

  for (Mover v : l) {
    v.go();
    v.recolor(beat.isSnare(), beat.isHat(), beat.isKick());
    for (Mover k : l)
      v.collideEqualMass(k);
  }

  ilusao();
}

void ilusao() {
  noStroke();
  fill(255);
  rect(200, 0, 5, height);
  rect(970, 0, 5, height);
  noFill();
}

void keyPressed() {
  if (key == 's') {
    saveFrame("frames/####.png");
  }
}
