package tarrafalogo;

import processing.core.PApplet;
import processing.core.PFont;

public class TarrafaLogo extends PApplet {
	PFont font;
	Grid grid;
	int state = 0;
	int cx, cy;

	@Override
	public void setup() {
		// size(displayWidth, displayHeight);
		// size(displayWidth, displayHeight, P3D);

		size(600, 600);

		if (frame != null) {
			frame.setResizable(true);
		}

		grid = new Grid(this, 600, 600, 12);

		textAlign(CENTER, CENTER);
		rectMode(CENTER);
		imageMode(CENTER);

		background(40);
		smooth();
	}

	// public int sketchWidth() {
	// return displayWidth;
	// }
	//
	// public int sketchHeight() {
	// return displayHeight;
	// }
	//
	// public String sketchRenderer() {
	// return P3D;
	// }

	// boolean sketchFullScreen() {
	// return true;
	// }
	@Override
	public void mouseClicked() {
		cx = mouseX;
		cy = mouseY;
		state++;
	}

	@Override
	public void draw() {
		background(40);

		grid.display();
		if (state == 1) {
			grid.updateGrid(cx, cy);
		} else if (state == 2) {
			grid.updateGrid(cx, cy);
		} else {
			state = 0;
		}
	}

	public static void main(String _args[]) {
		PApplet.main(new String[] { tarrafalogo.TarrafaLogo.class.getName() });
	}
}
