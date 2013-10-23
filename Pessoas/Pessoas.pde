import processing.serial.*;
import cc.arduino.*;

Arduino arduino;

PShape pessoas[];
float position;
color corPessoas[], bg, svg;
int x, y, quantidade, deslocation, nroPes = 6, ledPin = 13, val = 0, pirState = Arduino.LOW;
int anagPinSound = 2, anagPinLdr = 0, digPinSound = 6, digPinPir = 8;
int contador = 0;

long startTime;
long duration;

long previousMillis = 0;
long interval = 1000;

long previousMillis2 = 0;
long interval2 = 5000;

void setup() {

  size(displayWidth, displayHeight);

  frameRate(12);

  if (frame != null)
    frame.setResizable(true);

  pessoas = new PShape[nroPes];
  corPessoas = new color[nroPes*5];

  for (int pessoa = 0; pessoa < pessoas.length; pessoa++) {
    pessoas[pessoa] = loadShape("p" + pessoa + ".svg");
    pessoas[pessoa].disableStyle();
  }

  deslocation = width;
  position = 1;
  quantidade = 0;
  svg = 0;

  println(Arduino.list());

  arduino = new Arduino(this, Arduino.list()[0], 57600);
  arduino.pinMode(4, Arduino.INPUT);

  arduino.pinMode(ledPin, Arduino.OUTPUT);
  arduino.pinMode(digPinPir, Arduino.INPUT);
  arduino.pinMode(digPinSound, Arduino.INPUT);

  bg = color(237, 255, 231);
  corPessoas[svg] = color(0, 0, 0);

  fill(corPessoas[svg]);
  noStroke();
  background(bg);
}

void draw() {
  background(bg);
  pes();
  pir();
  clap();
}

void pes() {
  switch (quantidade) {
  case 0:
    break;
  case 1:
    shape( pessoas[0], ( x += position ) % deslocation +   0, y, 200, height );
    break;
  case 2:
    shape( pessoas[0], ( x += position ) % deslocation +   0, y, 200, height );
    shape( pessoas[1], ( x += position ) % deslocation + 240, y, 500, height );
    break;
  case 3:
    shape( pessoas[2], ( x += position ) % deslocation + 100, y, 300, height );
    shape( pessoas[1], ( x += position ) % deslocation + 270, y, 500, height );
    break;
  case 4:
    shape( pessoas[0], ( x += position ) % deslocation +   0, y, 200, height );
    shape( pessoas[1], ( x += position ) % deslocation + 200, y, 500, height );
    shape( pessoas[2], ( x += position ) % deslocation + 540, y, 300, height );
    shape( pessoas[3], ( x += position ) % deslocation - 190, y, 200, height );
    break;
  case 5:
    shape( pessoas[0], ( x += position ) % deslocation +   0, y, 200, height );
    shape( pessoas[1], ( x += position ) % deslocation +  40, y, 500, height );
    shape( pessoas[2], ( x += position ) % deslocation - 230, y, 300, height );
    shape( pessoas[3], ( x += position ) % deslocation + 390, y, 200, height );
    shape( pessoas[4], ( x += position ) % deslocation - 538, y, 200, height );
    break;
  case 6:
    shape( pessoas[2], ( x += position ) % deslocation + 180, y, 300, height );
    shape( pessoas[1], ( x += position ) % deslocation + 270, y, 500, height );
    shape( pessoas[0], ( x += position ) % deslocation +   0, y, 200, height );
    shape( pessoas[3], ( x += position ) % deslocation + 600, y, 200, height );
    shape( pessoas[4], ( x += position ) % deslocation -  90, y, 200, height );
    shape( pessoas[5], ( x += position ) % deslocation - 490, y, 200, height );
    break;
  default:
    break;
  }
}

void mousePressed() {
  quantidade++;
}

void clap() {
  long currentMillis2 = millis();

  if (currentMillis2 - previousMillis2 > interval2) {

    if (arduino.analogRead(0) < 500) {
      // supostamente claro
      bg = color(
      floor(random(arduino.analogRead(0) - 100)),
      floor(random(arduino.analogRead(2) - 57)),
      floor(random(58)));
      corPessoas[svg+=1%corPessoas.length-1] = color(
      floor(random(arduino.analogRead(2) - 75)),
      floor(random(arduino.analogRead(2) - 50, 88)),
      floor(random(arduino.analogRead(2) - 50, 99)));
      fill(corPessoas[svg]);
    }
    else if (arduino.analogRead(0) > 900) {
      // supostamente escuro
      bg = color(
      floor(random(arduino.analogRead(0) - 100)),
      floor(random(arduino.analogRead(0) - 57)),
      floor(random(58)));
      corPessoas[svg+=1%corPessoas.length-1] = color(
      floor(random(arduino.analogRead(2) - 75)),
      floor(random(arduino.analogRead(2) - 50, 88)),
      floor(random(arduino.analogRead(2) - 50, 99)));
      fill(corPessoas[svg]);
    }
    previousMillis2 = currentMillis2;
  }
}

void pir() {
  long currentMillis = millis();

  if (currentMillis - previousMillis > interval) {

    val = arduino.digitalRead(digPinPir);

    if (val == Arduino.HIGH) {

      arduino.digitalWrite(ledPin, Arduino.HIGH);
      if (pirState == Arduino.LOW) {
        println("Motion detected!");
        pirState = Arduino.HIGH;
        if (quantidade < pessoas.length) {
          quantidade++;
        }
        else {
          quantidade = 0;
        }
      }
    }
    else {
      arduino.digitalWrite(ledPin, Arduino.LOW);
      if (pirState == Arduino.HIGH) {
        println("Motion ended!");
        pirState = Arduino.LOW;
      }
    }
    previousMillis = currentMillis;
  }
}

void keyPressed() {
  if (key == 's') {
    set(0, 0, get(0, 0, width, height));
    save("pics/frame-" + nf(frameCount, 4) + ".png");
  }
}

boolean sketchFullScreen() {
  return true;
}
