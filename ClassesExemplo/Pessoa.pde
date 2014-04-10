public class Pessoa {

  private int idade;
  private String nome;
  private char sexo;
  private PVector localidade, direcao, aceleracao;

  public Pessoa (int idade, String nome, char sexo) {
    this.idade = idade;
    this.nome = nome;
    this.sexo = sexo;

    iniciaVetores();
  }

  public void iniciaVetores() {
    localidade = new PVector(random(width/2), random(height/2));
    direcao = new PVector(random(1), random(1));
    aceleracao = new PVector(random(1), random(1));
  }

  public void display() {
    pushMatrix();
    translate(localidade.x, localidade.y);
    fill(0);
    text(this.nome, localidade.x - 20, localidade.y - 20);
    fill(#883aff);
    stroke(43);
    strokeWeight(2);
    ellipse(localidade.x + 5, localidade.y - 8, 10, 10);
    rect(localidade.x, localidade.y, 10, 40);
    rect(localidade.x + 13, localidade.y + 7, 2, 20);
    rect(localidade.x - 5, localidade.y + 7, 2, 20);
    popMatrix();
  }

  public void caminha() {
    localidade.add(direcao);
    localidade.add(aceleracao);
  }

  public String fala() {
    return "olá";
  }

  public PVector getLocalidade() {
    return localidade;
  }

  public void setDirecao(float direcao) {
    this.direcao.mult(direcao);
  }

  public void setAceleracao(float aceleracao) {
    this.aceleracao.mult(aceleracao);
  }
}

