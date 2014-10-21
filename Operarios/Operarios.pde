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

  POPULATION = 130;

  size(1200, 600);

  l = new ArrayList<Mover>();

  int height2 = height;
  int width2 = width;

  for (int i = 0; i < POPULATION; i++) {
    l.add(new Mover(new PVector(random(-0.35, 0.35), random(-0.35, 0.35)), new PVector(random(width2), random(height2))));
  }

  song = minim.loadFile("radio.mp3", 2048);
  song.play();

  beat = new BeatDetect(song.bufferSize(), song.sampleRate());

  beat.setSensitivity(60);
  kicksize = snaresize = hatsize = 16;

  b1 = new BeatListener(beat, song);
  textFont(createFont("Helvetica", 16));
  textAlign(CENTER);
}

void draw() {
  background(43);
  
  if (beat.isHat())
    hatsize = 32;
  if (beat.isSnare())
    snaresize = 32;
  if (beat.isKick())
    kicksize = 32;

  for (Mover v : l) {
    v.go();
    v.coloreConformeMusica(beat.isSnare(), beat.isHat(), beat.isKick(), beat);
    v.moveConformeMusica(beat.isSnare(), beat.isHat(), beat.isKick(), beat);
    for (Mover k : l)
      v.collideEqualMass(k);
  }
  
  hatsize = constrain(hatsize * 0.95, 16, 32);
  snaresize = constrain(snaresize * 0.95, 16, 32);
  kicksize = constrain(kicksize * 0.95, 16, 32);
  
  println("Hat size : ", hatsize);
  println("Snare size : ", snaresize);
  println("Kick size : ", kicksize);

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
