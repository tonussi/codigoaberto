import processing.serial.*;

Serial myport;

int portindex = 0; // Arduino USB port number from the serial list
int sz;

void setup()
{
  size(250, 250);
  // Mostra as portas disponiveis no computador
  println(Serial.list());
  println("Connecting to "+Serial.list()[portindex]);

  // Porta ttyACM0 no meu caso Ubuntu Linux
  myport = new Serial(this, Serial.list()[portindex], 57600);

  background(41);
  fill(255);
  stroke(255);
}

void draw() {
  envia();
  ellipse(random(width), random(height), sin(random(4)), frameRate/PI*cos(random(5)));
  if (frameRate == 500)
    frameRate = 0;
}

void envia() {
  // Aponta para o arquivo
  byte data[] = loadBytes("mb.txt");
  sz=data.length;

  // Mostra o tamanho do arquivo
  println("Tamanho: "+sz+"\n");
  println("Enviando dados...\n");

  for (int i = 0; i < sz; i++) {
    print(byte(data[i])); // Monitor send data
    myport.write(byte(data[i])); // Converte Decimal para ASCII
  }

  println("\n\nCompleto\n");
}

