public class Grid {

  private GridPoint[][] gridpoint;
  private float radius;
  private int offSet;
  private int spaceGrid;
  private int DEFAULT_GWH = 100;

  public Grid(int gridWidth, int gridHeight, float radius) {
    if (gridWidth > 0 && gridHeight > 0)
      gridpoint = new GridPoint[gridWidth][gridHeight];
    else
      gridpoint = new GridPoint[DEFAULT_GWH][DEFAULT_GWH];

    for (int i = 0; i < grid.length; i+=1)
      for (int j = 0; j < grid[i].length; j+=1)
        gridpoint[i][j] = GridPoint(i, j);

    spaceGrid = 20;
    offSet = 1;
    this.radius = (radius > 0)? radius : 10;
  }

  public void display() {
    for (int i = spaceGrid; i < grid.length; i+=spaceGrid)
      for (int j = spaceGrid; j < grid[i].length; j+=spaceGrid)
        gridpoint.display(i, j);
  }

  public void updateGrid() { /*paraqueserveressemetodo?*/ }

  public void preenche(int i, int j) {
    noStroke();
    if (grid[i][j] == 1)
      fill(color(255, 230, 120, 30));
    else
      fill(color(40, 230, 10, 20));
    ellipse(i, j, 12, 12);
  }
}

