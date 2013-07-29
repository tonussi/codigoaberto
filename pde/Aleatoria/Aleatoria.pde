/**
 * betonbabe:
 * FRIEDER NAKE
 * COMPUTER-GENERATED GRAPHIC / FIELDS WITH RANDOMLY DISTRIBUTED SQUARES, 1965 
 * Random elements:
 * - amount of fields to be filled
 * - selection of these fields
 * - amount of squares in each field
 * - position of the squares in each field
 */

Cgg nake;

void setup() {
  size(400, 400);
  background (255);
  nake = new Cgg();

  nake.amountOfFieldsToBeFilled();
  nake.selectionOfTheseFields();
  nake.amountOfSquaresInEachField();
  nake.positionOfTheSquaresInEachField();
  nake.scan();
}

void draw() {
}

void mouseClicked() {
  background (255);
  nake.amountOfFieldsToBeFilled();
  nake.selectionOfTheseFields();
  nake.amountOfSquaresInEachField();
  nake.positionOfTheSquaresInEachField();
  nake.scan();
}


/**void keyPressed() {
  this.set(0, 0, this.get(0, 0, width, height));
  this.save("pics/frame-" + this.nf(frameCount, 4) + ".png");
}*/
