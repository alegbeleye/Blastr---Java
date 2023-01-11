class BossProjectile extends Projectile{
  Player target;
  float followTimer;
  
  BossProjectile(PVector pos, PVector dim, PVector vel, Player x){
    super(pos, dim, vel);
    isAlive = true;
    this.target = x;
    followTimer = 0;
  }
  
  void drawMe(){
    noStroke();
    pushMatrix();
    translate(pos.x,pos.y); // Translate to the center of the bullet to allow for smooth rotation;
    rotate(vel.heading());//Rotate towards the velocity
    
    fill(38,34,98);// Dark Purple
    ellipse(0, 0, dim.x, dim.y);
    
    fill(113,21,255);//Light Purple
    ellipse(0,0, dim.x/2, dim.y/2);
    
    popMatrix();
  }
  
  void update(){
    super.update();
    checkWalls();
    
    //Increment follow Timer
    followTimer += 1;
  }
  
  
  //MOVE FUNCTION TO MAKE THE PROJECTILE FOLLOW THE PLAYER FORHALF A SECOND
  void move(){
    //set velocity direction  and let it follow the player for half a second
    if(followTimer/60 < 0.5){
      PVector acc = PVector.sub(target.pos, pos);
      vel.add(acc);
      vel.limit(10);
      super.move();
    }else{
      super.move();
    }
  }
  
  //CHECKING IF THE BULLET IS OUT OF THE VIEW PORT - SET IS ALIVE TO FALSE IF TRUE
  void checkWalls(){
    if(pos.y-dim.y/2 > height){
      isAlive = false;
    }
  }
}  
