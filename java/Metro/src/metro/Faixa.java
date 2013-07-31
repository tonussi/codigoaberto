package metro;

import processing.core.PApplet;

@SuppressWarnings("serial")
public class Faixa extends PApplet {

	protected float espessura, largura, x, y;

	public Faixa(float espessura, float largura, float x, float y) {
		super();
		this.espessura = espessura;
		this.largura = largura;
		this.x = x;
		this.y = y;
	}

	public void display() {
		rect(0, 0, width, height);
	}

}
