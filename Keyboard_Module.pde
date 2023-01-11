boolean up, down, left, right, shoot;
PVector upForce=new PVector(0, -2);
PVector upAcc = new PVector(0, -2);
PVector downAcc = new PVector(0, 2);
PVector leftAcc = new PVector(-2, 0);
PVector rightAcc = new PVector(2, 0);

void keyPressed() {
  if (key==CODED) {
    if (keyCode==LEFT) left=true;
    if (keyCode==UP) up=true;
    if (keyCode==DOWN) down=true;
    if (keyCode==RIGHT) right=true;
  }

  if (key=='x') { //when space bar is hit
    ship.shoot();
  }
}

void keyReleased() {
  if (key==CODED) {
    if (keyCode==LEFT) left=false;
    if (keyCode==UP) up=false;
    if (keyCode==DOWN) down=false;
    if (keyCode==RIGHT) right=false;
  }
}
