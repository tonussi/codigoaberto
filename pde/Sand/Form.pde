//creativeoffice
void sand () {
  if (mousePressed) {

    float rxp = ((mouseX-(width/2))*0.005);
    float ryp = ((mouseY-(height/2))*0.005);
    float px = (frameCount*0.3)+(rxp*0.1);
    float py = (frameCount*0.3)+(ryp*0.1);
    
    translate (mouseX-25,mouseY-25);
    pushMatrix();
    
    for (int phi=0; phi<=60; phi++) {
      float x = (0.25) * (-pow (phi,2) + 40*phi + px) * sin ((PI*phi)/180) - rxp;
      float y = -(0.25) * (-pow (phi,2) + 40*phi + py) * cos ((PI*phi)/180) - ryp;
      point (x,y);
      point (-x,y);
      rotateX (y);
      rotateY (x);
    }
    popMatrix();

  }
}
