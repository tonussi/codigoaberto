import processing.serial.*;

Serial myport;

int portindex = 0; // Arduino USB port number from the serial list
int sz;

void setup()
{
  // Aponta para o arquivo
  byte data[] = loadBytes("um_kb.bin");
  sz=data.length;

  // Mostra o tamanho do arquivo
  println("Tamanho: "+sz+"\n");

  // Mostra as portas disponiveis no computador
  println(Serial.list());
  println("Connecting to "+Serial.list()[portindex]);

  // Porta ttyACM0 no meu caso Ubuntu Linux
  myport = new Serial(this, Serial.list()[portindex], 14400);

  println("Enviando dados...\n"); 
  for (int i = 0; i < sz; i++) {     
    print(int(data[i])); // Monitor send data
    myport.write(int(data[i])); // Converte Decimal para ASCII
  }
  println("\n\nCompleto\n");
}
