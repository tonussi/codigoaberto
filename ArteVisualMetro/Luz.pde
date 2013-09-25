public class Luz {

  protected PVector posicao;
  float brilho;

  public Luz(int x, int y, float brilho) {
    posicao = new PVector(x, y);
    this.brilho = brilho;
  }

  public void display(Faixa faixa) {
    fill(255, 5);

    noStroke();

    beginShape();
    
    ellipse(posicao.x, posicao.y, brilho / 2.4f, brilho);

    posicao.cross(new PVector(faixa.x, faixa.y));

    endShape(PConstants.CLOSE);
  }
}

