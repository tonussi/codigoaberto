import java.util.ArrayList;

/**
 * Obra inspirada numa artevisual do metro de sampa
 * 
 * Linha 1-Azul - Estacao Santana
 * 
 * TITULO: Sem Titulo ARTISTA: Mauricio Nogueira Lima GENERO: Painel DATA: 1990
 * TECNICA: Pintura sobre placas de fibrocimento MATERIAL: Tinta acqua-cryl
 * DIMENSOES: 140 m2 PESO: LOCALIZACAO: Corredores de acesso aa plataforma
 * 
 * http://www.metro.sp.gov.br/cultura-lazer/arte-metro/arte-metro.aspx
 * 
 * Arte Visual consiste da (des)trui-construção na arte no mural você passa o
 * mouse nas pecinhas no canto direito baixo e destroi do contrario constroi.
 * 
 * @author Lucas Tonussi
 */


private ArrayList<Faixa> faixa;
private Luz luz;
private PFont font;
private int off, on;
int w, h, tamanho, op;

void setup() {
  size(800, 450);

  faixa = new ArrayList<Faixa>();

  for (int i = 0; i < width; i += 80)
    faixa.add(new Faixa(random(60, 130), height, i, 0));

  luz = new Luz(width - 120, -260, (width) / 2);

  faixa.add(new Faixa(width, 120, 0, height - 200, 0, 0, 0, 30));

  font = createFont("Ubuntu", 16, true);

  on = color(41, 50);

  off = color(255, 50);

  w = width;

  h = height;

  tamanho = 10;

  background(41);

  smooth();
}


void draw() {
  background(41);

  switch (op) {
  case 0:
    estado();
    break;
  case 685:
    estado();
    break;
  case 705:
    estado();
    break;
  case 725:
    estado();
    break;
  case 745:
    estado();
    break;
  case 765:
    estado();
    break;
  case 785:
    estado();
    break;
  }
  /**
   * op = {685, 705, 725, 745, 765, 785}
   */

  escolhas();
  resize();
}

public void estado() {
  for (int index = 0; index < faixa.size(); index++) {
    faixa.get(index).display(op);
    luz.display(faixa.get(index));
  }
}

public void escolhas() {
  fill(255);
  textFont(font, 16);
  text("Arte Visual", width - (12 * tamanho), (height - (2.5f * tamanho)));
  stroke(off);
  strokeWeight(1);
  for (int i = 0; i <= (tamanho / 2); i++) {
    if (mouseX == ((width - 20) - i * 20) + (tamanho / 2)
      && (mouseY > height - (2.5f * tamanho) && mouseY < height
      + (3 * tamanho))) {
      fill(on);
      op = ((width - 20) - i * 20) + (tamanho / 2);
    } 
    else if (mouseX != ((width - 20) - i * 20) + (tamanho / 2)
      && (mouseY < height - (2.5f * tamanho) || mouseY > height
      + (3 * tamanho))) {
      op = 0;
      fill(off);
    } 
    else {
      fill(off);
    }

    rect((width - (2 * tamanho)) - i * (2 * tamanho), height
      - (2 * tamanho), tamanho, tamanho);
  }
}

public void resize() {
  if (w != width || h != height) {
    reCreate();
    w = width;
    h = height;
  }
}

private void reCreate() {
  faixa.clear();

  for (int i = 0; i < width; i += 80)
    faixa.add(new Faixa(random(60, 130), height, i, 0));

  luz = new Luz(width - 120, -260, (width) / 2);

  faixa.add(new Faixa(width, 120, 0, height - 200, 0, 0, 0, 30));
}

public void keyPressed() {
  if (key == 'r') {
    reCreate();
  } 
  else if (key == 's') {
    save("fig/" + "frame" + round(frameRate) + ".png");
  }
}

