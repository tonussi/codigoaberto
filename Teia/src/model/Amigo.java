package model;

import processing.core.PApplet;
import processing.core.PVector;

public class Amigo {

	private Info info;

	private PVector local, dir, acel;
	PApplet processing;

	public Amigo(PApplet processing, Info info) {
		this.processing = processing;

		local = new PVector(processing.random(processing.width),
				processing.random(processing.height));
		dir = PVector.random2D();
		acel = PVector.random2D();

		this.info = info;
	}

	public void mova() {
		local.add(dir);
		local.add(acel);
	}

	public void display() {
		processing.pushMatrix();
		processing.translate(local.x, local.y);

		processing.fill(255);

		processing.triangle(local.x, local.y + 3, local.x + 3, local.y,
				local.x - 3, local.y);

		processing.stroke(255);
		processing.strokeWeight(2);
		processing.noFill();

		processing.ellipse(local.x, local.y, 20, 20);

		info.adicionaInformacao(local.x, local.y);

		processing.popMatrix();
	}
}