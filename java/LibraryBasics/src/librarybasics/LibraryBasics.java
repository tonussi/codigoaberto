package librarybasics;

import processing.core.PApplet;

public class LibraryBasics {

	PApplet parent;

	public void setup(PApplet parent) {
		this.parent = parent;
		parent.registerMethod("dispose", this);
	}

	public void dispose() {
		// Anything in here will be called automatically when
		// the parent sketch shuts down. For instance, this might
		// shut down a thread used by this library.
	}

	public void draw() {
	}

	public static void main(String _args[]) {
		PApplet.main(new String[] { librarybasics.LibraryBasics.class.getName() });
	}
}
