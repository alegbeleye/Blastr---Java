class Projectile{
  PVector pos;
  PVector dim;
  PVector vel;
  boolean isAlive;
  
  Projectile(PVector pos, PVector dim, PVector vel){
    this.pos = pos;
    this.dim = dim;
    this.vel = vel;
    isAlive = true;
  }
  
  void update(){
    move();
    checkWalls();
  }
  
  void move(){
    pos.add(vel);
  }
  
  void checkWalls(){
    if(pos.y+dim.y/2 < 0){
      isAlive = false;
    }
  }
  
  void hit(CharacterObject x){
    if(dist(pos.x, pos.y, x.pos.x, x.pos.y) < dim.x/2 + x.dim.y/2){
      isAlive = false;
      if(x.health > 0)x.decreaseHealth(1);
      x.resolveHit();
    }
  }
  
  
  void drawMe(){
    noStroke();
    pushMatrix();
    translate(pos.x, pos.y);
    fill(255,0,0);
    ellipse(0,0, dim.x, dim.y);
    fill(255,167,0);
    ellipse(0,0, dim.x/2, dim.y/2);
    popMatrix();
  }
  
}
