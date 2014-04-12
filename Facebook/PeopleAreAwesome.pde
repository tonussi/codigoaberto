public class PeopleAreAwesome {

  private String uname, sex, locale;
  private int agerank;
  private PVector localizacao, direcao, aceleracao;

  public PeopleAreAwesome (String uname, String sex, String locale, int agerank) {
    this.uname = uname;
    this.sex = sex;
    this.locale = locale;
    this.agerank = agerank;
    
    initVectors();
  }

  void initVectors() {
    this.localizacao = new PVector(random(width/2), random(height/2));
    this.direcao = new PVector(0.4, 0.4);
    this.aceleracao = new PVector(0.6, 0.7);
  }

  void display() {
    localizacao.add(direcao);
    localizacao.add(aceleracao);

    stroke(43, 43, 43, 40);
    fill(#B7BCF5);

    if (sex.equals("female"))
      fill(#F5B7F2);
  
    ellipse(localizacao.x, localizacao.y, 30, 30);
  }
}

