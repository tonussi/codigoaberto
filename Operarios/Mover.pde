class Mover {

  private PVector loc;
  private PVector vel;
  private float sumR;
  private float d;
  private float bounce;
  private float r;
  private boolean colliding;
  private int len;
  private float arrowsize;

  Mover(PVector v, PVector l) {
    vel = v.get();
    loc = l.get();

    bounce = 1.0;
    r = 10;
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

    drawVector(vel, loc, 10);
  }

  void recolor(float kicksize, float snaresize, float hatsize) {
    strokeWeight(2);
    stroke(0);
    fill((int)kicksize, (int)snaresize << 3, (int)hatsize);
    strokeWeight(1);
    stroke(220, (int)snaresize << 1, 230);
  }

  void drawVector(PVector v, PVector loc, float scayl) {
    pushMatrix();
    arrowsize = 20;
    translate(loc.x, loc.y);
    rotate(v.heading2D());
    len = (int) v.mag() << (int) scayl;
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

