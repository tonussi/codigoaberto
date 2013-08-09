package tarrafalogo;

import processing.core.PApplet;

public class Grid {

	private final int DEFAULT_GWH = 100;

	private int[][] grid;
	private final float radius;
	private final int offSet;
	private final int spaceGrid;
	private final PApplet processing;

	public Grid(PApplet p, int gridWidth, int gridHeight, float radius) {
		this.processing = p;

		if (gridWidth > 0 && gridHeight > 0)
			grid = new int[gridWidth][gridHeight];
		else
			grid = new int[DEFAULT_GWH][DEFAULT_GWH];

		for (int i = 0; i < grid.length; i += 1)
			for (int j = 0; j < grid[i].length; j += 1)
				grid[i][j] = 0;

		spaceGrid = 20;
		offSet = 1;
		this.radius = (radius > 0) ? radius : 10;
	}

	public void display() {
		processing.strokeWeight(5);
		processing.smooth();

		for (int i = spaceGrid; i < grid.length; i += spaceGrid) {
			for (int j = spaceGrid; j < grid[i].length; j += spaceGrid) {

				if (grid[i][j] == 1)
					processing.stroke(processing.color(66, 232, 83));
				else
					processing.stroke(255);

				processing.point(i, j);
			}
		}
	}

	public void updateGrid(int x, int y) {
		if (x >= 0 && x < grid.length && y >= 0 && y < grid.length) {
			grid[x + offSet + spaceGrid][y + offSet - spaceGrid] = 1;
			grid[x - offSet + spaceGrid][y - offSet - spaceGrid] = 1;
		}

		processing.fill(processing.color(0, 24, 124, 25));
		processing.ellipse(x, y, radius, radius);
	}
}
