public class Faixa {

  protected float espessura, altura, x, y, r, g, b, o, borda;

  public Faixa(float espessura, float altura, float x, float y) {
    this.espessura = espessura;
    this.altura = altura;
    this.x = x;
    this.y = y;
    this.borda = random(2.2f, 3.4f);
    r = random(190, 255);
    g = random(140, 255);
    b = random(138, 255);
    o = 100;
  }

  public Faixa(float espessura, float altura, float x, float y,
      float r, float g, float b, float o) {
    this.espessura = espessura;
    this.altura = altura;
    this.x = x;
    this.y = y;
    this.borda = 0;
    this.r = r;
    this.g = g;
    this.b = b;
    this.o = o;
  }

  public void display(int op) {
    fill(color(r, g, b, o));
    stroke(0);
    strokeWeight(borda);
    rect(x, y, espessura, altura);
    rotate(op / (PI * 6));

    /**
     * op = {685, 705, 725, 745, 765, 785}
     */
  }
}

