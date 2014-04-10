Pessoa p;
Ladrao l;

void setup() {
  size(300, 300);
  background(255);
  smooth();

  p = new Pessoa(51, "William Howard Taft", 'm');
  l = new Ladrao(32, "Justus D. Barnes", 'm', 55, 19, 123);
}

void draw() {
  background(255);

  p.caminha();
  l.caminha();

  if (p.getLocalidade().x > width/2 - 15 ||
    p.getLocalidade().y > height/2 - 15) {
    p.setDirecao(random(-1));
    p.setAceleracao(random(-1));
  }

  if (l.getLocalidade().x > width/2 - 15 ||
    l.getLocalidade().y > height/2 - 15) {
    l.setDirecao(random(-1));
    l.setAceleracao(random(-1));
  }
  if (p.getLocalidade().x < 0 + 15 ||
    p.getLocalidade().y < 0 + 15) {
    p.setDirecao(random(-1));
    p.setAceleracao(random(-1));
  }
  if (l.getLocalidade().x < 0 + 15 ||
    l.getLocalidade().y < 0 + 15) {
    l.setDirecao(random(-1));
    l.setAceleracao(random(-1));
  }

  p.display();
  l.display();

  if (PVector.dist(p.getLocalidade(), l.getLocalidade()) <= 0) {
    if (l.getVontadeParaRoubar() > 20) {
    }
  }
}

