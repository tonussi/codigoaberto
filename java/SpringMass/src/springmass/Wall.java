package springmass;

import processing.core.PApplet;
import processing.core.PVector;

public class Wall {
	protected float x, y, largura, altura;
	protected PVector forca;
	private boolean status, live;
	private int registro;
	PApplet p;

	public Wall(PApplet p, float x, float y, float largura, float altura) {
		super();
		this.p = p;
		this.x = x;
		this.y = y;
		this.largura = largura;
		this.altura = altura;

		forca = new PVector();
	}

	public void display() {
		p.noStroke();
		p.fill(255, 20);
		p.rect(x, y, largura, altura);
	}

	public void update() {
		if (live && status)
			this.setRegistro(this.getRegistro() + 1);
		else
			this.setRegistro(this.getRegistro() - 1);
	}

	public void status(Node node) {
		if (node.x < x && node.y < y)
			update();
		else
			status = false;
	}

	public int getRegistro() {
		return registro;
	}

	public void setRegistro(int registro) {
		this.registro = registro;
	}
}