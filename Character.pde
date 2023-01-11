class CharacterObject{
  int health;
  PVector pos;
  PVector dim;
  PVector vel;
  boolean isAlive;
  
  CharacterObject(int health, PVector pos, PVector dim, PVector vel){
    this.health = health;
    this.pos = pos;
    this.dim = dim;
    this.vel = vel;
    isAlive = true;
  }
  
  void drawMe(){
    circle(0,0, 10);
  }
  
  void update(){
    moveCharacter();
    checkWalls();
  }
  
  void moveCharacter(){
    pos.add(vel);
  }
  
  void accelerate(PVector force){
    vel.add(force);
  }
  
  void checkWalls(){
    if(pos.y+dim.y/2 > height){
      pos.y = pos.y-dim.y/2;
    }
    if(pos.x-dim.x/2 > width){
      pos.x =0;
    }
    
    if(pos.x+dim.x/2 < 0){
      pos.x = width;
    }
  }
  
  //CHECK IF CHARACTER OBJECT COLLIDES WITH ANOTHER CHARACTER OBJECT
  boolean hitCharacter(CharacterObject x){
    if(dist(pos.x, pos.y, x.pos.x, x.pos.y) < dim.x/2 + x.dim.x/3){
      return true;
    }
    
   return false;
  }

  void decreaseHealth(float value){
    health -= value;
  }
  
  void resolveDeath(){
    if(health <= 0){
      isAlive = false;
    } 
  }
  
  void resolveHit(){
      return;
  }
  
}
