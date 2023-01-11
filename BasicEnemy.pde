class BasicEnemy extends CharacterObject{
  float angle;
  float angleIncr;
  float scale;
  float freezeTimer;
  boolean destroyed;
  
  BasicEnemy(int health, PVector pos, PVector dim, PVector vel){
    super(health, pos, dim, vel);
    angle = random(-PI,PI);
    angleIncr = 0.03;
    freezeTimer = 0;
    destroyed = false;
  }
  
  void drawMe(){
    noStroke();
    
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(angle);
    PVector point1 = new PVector(0, 0+dim.y/2);
    PVector point2 = new PVector(0-dim.x/2, 0+dim.y/4);
    PVector point3 = new PVector(0-dim.x/2, 0-dim.y/4);
    PVector point4 = new PVector(0, 0-dim.y/2);
    PVector point5 = new PVector(0, 0+dim.y/2);
    PVector point6 = new PVector(0+dim.x/2, 0+dim.y/4);
    PVector point7 = new PVector(0+dim.x/2, 0-dim.y/4);
    PVector point8 = new PVector(0, 0-dim.y/2);
    
    fill(150,150,150);
    quad(
    point1.x + 5, point1.y+ 5,
    point2.x+ 5, point2.y+ 5,
    point3.x+ 5,point3.y+ 5,
    point4.x+ 5, point4.y+ 5);
    
    quad(
    point5.x + 5, point5.y + 5,
    point6.x + 5, point6.y + 5,
    point7.x + 5, point7.y + 5,
    point8.x + 5, point8.y + 5);
    
    fill(217,219,216);
    quad(
    point1.x, point1.y,
    point2.x, point2.y,
    point3.x,point3.y,
    point4.x, point4.y);
    
    quad(
    point5.x, point5.y,
    point6.x, point6.y,
    point7.x, point7.y,
    point8.x, point8.y);
    
    
    popMatrix();
    angle += angleIncr;
  }
  
  void update(){
    super.update();
  }
  
  //HERE WE CHECK IF THE ENEMY HAS LEFT THE VIEW PORT - IF TRUE WE REMOVE FROM ARRAY
  void checkWalls(){
    if(pos.x-dim.x/2 > width){
      pos.x =0;
    }
    
    if(pos.x+dim.x/2 < 0){
      pos.x = width;
    }
    
    if(pos.y-dim.y/2 > height){
       enemyList.remove(this);
       if(earthsHealth != 0)earthsHealth -= 1;
    }
  }
  
 //WE WANT TO CHECK IF THE ENEMY HAS COLLIDED WITH THE PLAYER
 void resolveCollision(CharacterObject x){
   resolveDeath();
    if(super.hitCharacter(x)){
      if(x.health > 0 && !destroyed){
        health-=1;
        x.health -= 1;
        resolveHit();
        return;
      } 
    }
  }
  
  //REDUCING THE ENEMY SIZE 20,25 WHEN IT IS HIT
  void resolveHit(){
    if(health > 0){
      dim.sub(new PVector(20,25));
      return;
    }
  }
  
  //IF ENEMY DIES WE WANT TO MAKE IT STOP MOVING AND START THE FREEZE TIMER THAT DICTATES HOW LONG IT IS ON SCREEN
  void resolveDeath(){
    if(health <= 0){
      freezeTimer += 1;
      destroyed = true;
      vel.set(0,0);
      angleIncr =0;
    }
    
    if(health <= 0 && freezeTimer/60 > 1){
      isAlive = false;
      enemyList.remove(this);
    } 
  }
  
  
}
