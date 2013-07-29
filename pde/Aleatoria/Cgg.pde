class Cgg {
  PFont font;
  float x, y, espessura;
  int fields[][];

  Cgg() {
    espessura = 5;
    fields = new int[width][height];
    font = createFont("Ubuntu", 4);
    textFont(font);
    textAlign(CENTER, CENTER);
  }//}

  /**
   * Esse é um exercício clássico da Computação Visual/Gráfica, onde você forma uma imagem
   * de algo aleatório. Server para que genemos imagems como o QrCode pode exemplo.
   */

  void scan() {
    for (int i = 0; i<fields.length; i++) {
      for (int j = 0; j<fields[i].length; j++) {
        print (fields[i][j]);
      }
      println();
    }
  }//=


  void amountOfFieldsToBeFilled() {
    for (int i = 0; i<fields.length; i++) {
      for (int j = 0; j<fields[i].length; j++) {
        fields[i][j] = parseInt(random(0, 2));
      }
    }
  }//>

  void selectionOfTheseFields() {
    for (int i = 0; i<fields.length; i++) {
      for (int j = 0; j<fields[i].length; j++) {
        if (random(1000) < 50) {
          fields[i][j] = 1;
        }
      }
    }
  }//<

  void amountOfSquaresInEachField() {
    /**
     *  00|1>>
     * -1-o-1-
     * <<1|1111
     */
    for (int i = 0; i<fields.length; i++) {
      for (int j = 0; j<fields[i].length; j++) {
        if (fields[(i+1)%width][j] == 1
          && fields[(i+2)%width][j] == 1
          && fields[(i+3)%width][j] == 1
          && fields[(i+4)%width][j] == 1
          && fields[(i+5)%width][j] == 1
          && fields[(i+6)%width][j] == 1
          && fields[(i+7)%width][j] == 1
          && fields[(i+8)%width][j] == 1) {

          x = i;
          y = j;
          positionOfTheSquaresInEachField();
        }
      }
    }
  }//~

  void positionOfTheSquaresInEachField() {
    //fill(0);
    //text (x+","+y, x, y);
    
    fill(255, 10);
    stroke(0, 95);
    rect (x, y, espessura, espessura);
  }//¬
}

/**
 * 0110101111101000011101001011001111110100
 * 1111001111011110101111010111000111010100
 * 0100110110111001010011111111111101100100
 * 0100111111101011111010111001001010001010
 * 0110001111001010111011010100110111000111
 * 1000010100110000011101001110111001000110
 */
