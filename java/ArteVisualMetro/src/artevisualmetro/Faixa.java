package artevisualmetro;

import processing.core.PApplet;

public class Faixa {

	protected float espessura, altura, x, y, r, g, b, o, borda;
	private final PApplet p;

	public Faixa(PApplet p, float espessura, float altura, float x, float y) {
		super();
		this.espessura = espessura;
		this.altura = altura;
		this.x = x;
		this.y = y;
		this.p = p;
		this.borda = p.random(2.2f, 3.4f);
		r = p.random(190, 255);
		g = p.random(190, 255);
		b = p.random(190, 255);
		o = 100;
	}

	public Faixa(PApplet p, float espessura, float altura, float x, float y,
			float r, float g, float b, float o) {
		super();
		this.espessura = espessura;
		this.altura = altura;
		this.x = x;
		this.y = y;
		this.p = p;
		this.borda = 0;
		this.r = r;
		this.g = g;
		this.b = b;
		this.o = o;
	}

	public void display() {
		p.fill(p.color(r, g, b, o));
		p.stroke(0);
		p.strokeWeight(borda);
		p.rect(x, y, espessura, altura);
	}

}
