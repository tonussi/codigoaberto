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
  private int kickCounter;

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

  void moveConformeMusica(boolean snare, boolean hat, boolean kick, BeatDetect beat) {

    if (kick && !snare && !hat) {

      PVector n = PVector.sub(PVector.random2D(), loc);
      n.normalize();

      PVector u = PVector.sub(PVector.random2D(), vel);

      PVector un = componentVector(u, n);

      u.sub(un);

      vel = PVector.add(u, vel);
      vel = PVector.add(un, vel);
    } else if (!kick && snare && !hat && kickCounter >= 110) {

      vel.y = random(-1, 1);
      vel.x = random(-1, 1);
    
    } else if (!kick && !snare && hat && kickCounter >= 110) {

      vel.y = random(-1, 1);
      vel.x = random(-1, 1);
    
    }

    kickCounter++;

    if (!kick && !snare && !hat && kickCounter >= 110) {

      vel.x = 0;

      vel.y = 0;

      kickCounter = 0;

      println(kickCounter);
    }
  }

  void coloreConformeMusica(boolean snare, boolean hat, boolean kick, BeatDetect beat) {

    if (kick && !snare && !hat) {

      cor1 = color(#BE57D3, 30);

      cor2 = color(#B09ECE, 30);

    } else if (!kick && !snare && hat) {

      cor1 = color(#57A3D3, 30);

      cor2 = color(#E8ABE7, 30);

    } else {

      cor1 = color(#57A3D3, 30);

      cor2 = color(#C7E0CF, 30);

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
