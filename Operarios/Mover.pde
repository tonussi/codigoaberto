class Mover {

  private PVector loc;
  private PVector vel;
  private float sumR;
  private float d;
  private float bounce;
  private float r;
  private boolean colliding;
  private float len;
  private float arrowsize;
  private float LENGHT_ANTENA;
  private color cor2;
  private color cor1;

  Mover(PVector v, PVector l) {
    vel = v.get();
    loc = l.get();

    bounce = 1.0;

    r = random(10, 20);
    LENGHT_ANTENA = r + 0xf;


    colliding = false;
  }

  // Method to update location
  void update() {
    loc.add(vel);
  }

  // Method to display
  void display() {
    pushMatrix();
    ellipseMode(CENTER);
    translate(loc.x, loc.y);
    ellipse(1, 1, r, r);
    popMatrix();

    drawVector(vel, loc, LENGHT_ANTENA);
  }

  void recolor(boolean snare, boolean hat, boolean kick) {
    if (kick && !snare && !hat) {
      cor2 = color(120, 40, 130, 30);
      cor1 = color(40, 90, 120, 90);
    } else if (snare && !kick && !hat) {
      cor2 = color(30, 110, 180, 30);
      cor1 = color(40, 30, 70, 90);
    } else if (hat && !snare && !kick) {
      cor2 = color(20, 140, 120, 30);
      cor1 = color(10, 30, 200, 90);
    } else if (hat || snare && !kick) {
      cor2 = color(130, 40, 120);
      cor1 = color(10, 30, 200, 90);
    }
    fill(cor1);
    stroke(cor2);
  }

  void drawVector(PVector v, PVector loc, float scayl) {
    pushMatrix();
    arrowsize = 20;
    translate(loc.x, loc.y);
    rotate(v.heading2D());
    len = v.mag() * scayl;
    line(0, 0, len, 0);
    line(len, 0, len-arrowsize, +arrowsize);
    line(len, 0, len-arrowsize, -arrowsize);
    popMatrix();
  }

  // Main method to operate object
  void go() {
    update();
    borders();
    display();
  }

  void collideEqualMass(Mover other) {
    d = PVector.dist(loc, other.loc);
    sumR = r + other.r;
    // Are they colliding?
    if (!colliding && d <= sumR) {
      colliding = true;
      // Direction of one object another
      PVector n = PVector.sub(other.loc, loc);
      n.normalize();

      // Difference of velocities so that we think of one object as stationary
      PVector u = PVector.sub(vel, other.vel);

      // Separate out components -- one in direction of normal
      PVector un = componentVector(u, n);
      // Other component
      u.sub(un);
      // These are the new velocities plus the velocity of the object we consider as stastionary
      vel = PVector.add(u, other.vel);
      other.vel = PVector.add(un, other.vel);
    } else if (d > sumR) {
      colliding = false;
    }
  }

  PVector componentVector (PVector vector, PVector directionVector) {
    directionVector.normalize();
    directionVector.mult(vector.dot(directionVector));
    return directionVector;
  }

  void borders() {
    if (loc.y > height) {
      vel.y *= -bounce;
      loc.y = height;
    } else if (loc.y < 0) {
      vel.y *= -bounce;
      loc.y = 0;
    } 
    if (loc.x > width) {
      vel.x *= -bounce;
      loc.x = width;
    } else if (loc.x < 0) {
      vel.x *= -bounce;
      loc.x = 0;
    }
  }
}
