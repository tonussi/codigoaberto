package artevisualmetro;

import processing.core.PApplet;
import processing.core.PConstants;
import processing.core.PVector;

public class Luz {

	protected PVector posicao;
	private final PApplet p;
	float brilho;

	public Luz(PApplet p, int x, int y, float brilho) {
		super();
		this.p = p;
		posicao = new PVector(x, y);
		this.brilho = brilho;
	}

	public void display(Faixa faixa) {
		p.fill(255, 5);

		p.noStroke();

		p.beginShape();

		p.ellipse(posicao.x, posicao.y, brilho / 2.4f, brilho);

		posicao.cross(new PVector(faixa.x, faixa.y));

		p.endShape(PConstants.CLOSE);
	}
}
