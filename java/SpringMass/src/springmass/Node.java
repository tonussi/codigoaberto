package springmass;

import processing.core.PApplet;
import processing.core.PVector;

public class Node {
	protected PVector dir, vel, acel;
	protected float variante, espessura, largura, x, y;
	private boolean live;
	private final PApplet p;

	public Node(PApplet p) {
		this.p = p;
	}

	public Node(PApplet p, float variante, float espessura, float largura,
			float x, float y) {
		super();
		this.p = p;
		this.variante = variante;
		this.espessura = espessura;
		this.largura = largura;
		this.x = x;
		this.y = y;

		initVectors();
	}

	private void initVectors() {
		dir = new PVector();
		vel = new PVector();
		acel = new PVector();

		dir = PVector.random2D();
		vel = PVector.random2D();
		acel = PVector.random2D();
	}

	public void display() {
		p.noStroke();
		p.fill(255, 20);
		p.ellipse(x, y, espessura, largura);
	}

	public void update() {
		dir.cross(vel);

		vel.add(acel);

		x += dir.x;

		y += dir.y;
	}

	public void check() {
		if (live)
			update();
	}

}
