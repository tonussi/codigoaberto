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

  //background(#00FF00);
  background(#ffffff);

  POPULATION = 160;

  size(1200, 600);

  l = new ArrayList<Mover>();

  for (int i = 0; i < POPULATION; i++) {
    l.add(new Mover(new PVector(random(-0.35, 0.35), random(-0.35, 0.35)), new PVector(random(width), random(height))));
  }

  song = minim.loadFile("song.mp3", 1024);
  song.play();

  beat = new BeatDetect(song.bufferSize(), song.sampleRate());

  beat.setSensitivity(50);
  kicksize = snaresize = hatsize = 16;

  b1 = new BeatListener(beat, song);
  textFont(createFont("Helvetica", 16));
  textAlign(CENTER);
}

void draw() {
  background(43);

  if (beat.isKick())
    kicksize = 32;
  if (beat.isSnare())
    snaresize = 32;
  if (beat.isHat())
    hatsize = 32;

  textSize(kicksize);
  text("KICK", width/4, height/2);
  textSize(snaresize);
  text("SNARE", width/2, height/2);
  textSize(hatsize);
  text("HAT", 3*width/4, height/2);
  noFill();

  kicksize = constrain(kicksize * 0.95, 16, 32);
  snaresize = constrain(snaresize * 0.95, 16, 32);
  hatsize = constrain(hatsize * 0.95, 16, 32);

  for (Mover v : l) {
    v.go();
    v.recolor(kicksize, snaresize, hatsize);
    for (Mover k : l)
      v.collideEqualMass(k);
  }

  ilusao();
}

void ilusao() {
  fill(#ffffff);
  rect(180, 0, 10, height);
  rect(990, 0, 10, height);
}

void keyPressed() {

  if (key == 's') {
    set(0, 0, get(0, 0, width, height));
    save("pics/frame-" + nf(frameCount, 4) + ".png");
  }
}

