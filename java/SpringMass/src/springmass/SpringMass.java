package springmass;

import processing.core.PApplet;

public class SpringMass extends PApplet {
	Node node;
	Wall wallLeft, wallRight, wallTop, wallBottom;

	@Override
	public void setup() {
		size(800, 450);
		background(41);
		node = new Node(this, 20, 20, 20, width / 2, height / 2);

		wallLeft = new Wall(this, 0, 0, 20, height);
		wallBottom = new Wall(this, 20, height, height, 20);
		wallRight = new Wall(this, width, 20, 20, height - 20);
		wallTop = new Wall(this, 20, 0, width - 20, 20);
	}

	@Override
	public void draw() {
		background(41);

		node.display();
		node.update();
		node.check();

		wallLeft.display();
		wallTop.display();
	}

	public static void main(String _args[]) {
		PApplet.main(new String[] { springmass.SpringMass.class.getName() });
	}
}
