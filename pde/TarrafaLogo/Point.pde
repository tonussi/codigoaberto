public class GridPoint {

  private float radius, offSet, spaceGrid, DEFAULT_GWH;
  private int x, y;

  public GridPoint(int x, int y, int spaceGrid, float offSet, float radius) {
    this.offSet = offSet;
    this.spaceGrid = spaceGrid;

    if (x >= spaceGrid && x < width - spaceGrid && y >= spaceGrid && y < height - spaceGrid) {
      this.x = x;
      this.y = y;
    }
    this.radius = (radius > 0)? radius : 10;
  }

  public void display(int i, int j) {
    noStroke();
    if (grid[i][j] == 1)
      fill(color(255, 230, 120, 30));
    else
      fill(color(40, 230, 10, 20));
    ellipse(i, j, 12, 12);
  }
}

