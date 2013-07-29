public class Grid {

  private int[][] grid;
  private float radius;
  private int offSet;
  private int spaceGrid;
  private int DEFAULT_GWH = 100;

  public Grid(int gridWidth, int gridHeight, float radius) {
    if (gridWidth > 0 && gridHeight > 0)
      grid = new int[gridWidth][gridHeight];
    else
      grid = new int[DEFAULT_GWH][DEFAULT_GWH];

    for (int i = 0; i < grid.length; i+=1)
      for (int j = 0; j < grid[i].length; j+=1)
        grid[i][j] = 0;

    spaceGrid = 20;
    offSet = 1;
    this.radius = (radius > 0)? radius : 10;
  }

  public void display() {
    strokeWeight(5);
    smooth();

    for (int i = spaceGrid; i < grid.length; i+=spaceGrid) {
      for (int j = spaceGrid; j < grid[i].length; j+=spaceGrid) {

        if (grid[i][j] == 1)
          stroke(color(66, 232, 83));
        else
          stroke(255);

        point(i, j);
      }
    }
  }

  public void updateGrid(int x, int y) {
    if (x >= 0 && x < grid.length && y >= 0 && y < grid.length) {
      grid[x + offSet + spaceGrid][y + offSet - spaceGrid] = 1;
      grid[x - offSet + spaceGrid][y - offSet - spaceGrid] = 1;
    }



    //fill(color(0, 24, 124, 25));
    //ellipse(x, y, radius, radius);
  }
}
