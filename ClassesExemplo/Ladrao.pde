public class Ladrao extends Pessoa {

  private int vontadeParaRoubar;
  private int energiaParaCorrer;
  private int sagacidadeParaFugir;

  public Ladrao(int idade, 
  String nome, 
  char sexo, 
  int vontadeParaRoubar, 
  int energiaParaCorrer, 
  int sagacidadeParaFugir) {
    super(idade, nome, sexo);
    this.vontadeParaRoubar = vontadeParaRoubar;
    this.energiaParaCorrer = energiaParaCorrer;
    this.sagacidadeParaFugir = sagacidadeParaFugir;
  }

  public int getVontadeParaRoubar() {
    return vontadeParaRoubar;
  }

  public int getEnergiaParaCorrer() {
    return energiaParaCorrer;
  }

  public int getSagacidadeParaFugir() {
    return sagacidadeParaFugir;
  }
}

