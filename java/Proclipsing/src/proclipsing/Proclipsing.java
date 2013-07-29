package proclipsing;

import processing.core.PApplet;

public class Proclipsing extends PApplet {

	// An array of stripes
	Stripe[] stripes = new Stripe[50];

	@Override
	public void setup() {
		size(200, 200);
		// Initialize all "stripes"
		for (int i = 0; i < stripes.length; i++) {
			stripes[i] = new Stripe(this);
		}
	}

	@Override
	public void draw() {
		background(100);
		// Move and display all "stripes"
		for (int i = 0; i < stripes.length; i++) {
			stripes[i].move();
			stripes[i].display();
		}
	}

	public static void main(String _args[]) {
		PApplet.main(new String[] { proclipsing.Proclipsing.class.getName() });
	}
}