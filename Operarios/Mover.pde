class Mover {

  PVector loc;
  PVector vel;
  float sumR, d;
  float bounce = 1.0;
  float r = 10;
  boolean colliding = false;

  Mover(PVector v, PVector l) {
    vel = v.get();
    loc = l.get();
  }

  // Method to update location
  void update() {
    loc.add(vel);
  }

  // Method to display
  void display() {
    //ellipseMode(CENTER);
    //noStroke();
    //stroke(0);
    //noFill();
    //fill(175,200);
    //ellipse(loc.x, loc.y, r, r);
    drawVector(vel, loc, 10);
  }

  void drawVector(PVector v, PVector loc, float scayl) {
    pushMatrix();
    float arrowsize = 20;
    // Translate to location to render vector
    translate(loc.x, loc.y);
    //stroke(0);
    // Call vector heading function to get direction (note that pointing up is a heading of 0) and rotate
    rotate(v.heading2D());
    // Calculate length of vector & scale it to be bigger or smaller if necessary
    float len = v.mag();
    // Draw three lines to make an arrow (draw pointing up since we've rotate to the proper direction)
    if (colliding && d < sumR + 2*r) {      
      stroke(#7BA8E5, 70);
      // fill(random(240), random(140), random(140), 80);
      line(0, 0, len, 0);
      line(len, 0, len-arrowsize, +arrowsize);
      line(len, 0, len-arrowsize, -arrowsize);
    } else if (!colliding && d < sumR + 2*r) {
      stroke(#255255, 40);
      // fill(random(240), random(140), random(140), 80);
      line(0, 0, len, 0);
      line(len, 0, len-arrowsize, +arrowsize);
      line(len, 0, len-arrowsize, -arrowsize);
    }
    noFill();
    noStroke();
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
    if (!colliding && d < sumR) {
      // Yes, make new velocities!
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
    //--! ARGUMENTS: vector, directionVector (2D vectors)
    //--! RETURNS: the component vector of vector in the direction directionVector
    //-- normalize directionVector
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
