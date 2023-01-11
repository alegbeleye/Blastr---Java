class BossEnemy extends BasicEnemy{
  PImage bossImage;
  PImage bossDefeat;
  PImage bossExplosion;
  ArrayList<BossProjectile> bullets = new ArrayList<BossProjectile>();
  float shootTimer;
  float moveTimer;
  float damp;
  
  BossEnemy(int health, PVector pos, PVector dim, PVector vel){
    super(health, pos, dim, vel);
    bossImage =loadImage("Assets/Enemy.png");
    bossImage.resize((int)dim.x,(int)dim.y+40);
    
    bossExplosion = loadImage("Assets/explosion.png");
    bossExplosion.resize((int)dim.x,(int)dim.y+40);
    
    bossDefeat = loadImage("Assets/EnemyDefeat.png");
    bossDefeat.resize((int)dim.x,(int)dim.y+40);
    
    shootTimer = 1;
    moveTimer = 1;
    damp = .8;
  }
  
  void drawMe(){
    pushMatrix();
    translate(pos.x,pos.y);
    rotate(radians(180));
    noTint();
    if(health > 5){
      image(bossImage, -dim.x/2,0);
    }else if(!destroyed){
      image(bossDefeat, -dim.x/2,0);
    }else{
      image(bossExplosion, -dim.x/2, 0);
    }
    popMatrix();
    
  }
  
  void update(){
    if(!destroyed){
      
      vel.mult(damp);
      
      moveCharacter();
      
      checkWalls();
      //Incement Shoot Timer - we do this so we can tell the boss to shoot after every one second
      shootTimer+=1;
      
      //Increment Move Timer - we do this to randomly move the boss after every one second
      moveTimer += 1;
      
     // Shoot after every one second
     if((shootTimer/60) % 2 == 0){
        shoot();   
     }
    }
    
    
   
   //Show Bullets on screen
    renderBullets();
   
   //Check if the boss is Dead
    resolveDeath();
    
   //Checkif the boss hits the character
    resolveCollision(ship);
  }
  
  //FUNCTION TO MOVE THE BOSS AFTER EVERY ONE SECOND - EITHER LEFT OR RIGHT
  void moveCharacter(){
    if(moveTimer/60 % 2 == 0){
      vel.x = random(-100,100);
    }
    super.moveCharacter();
  }
  
  void shoot(){
    bullets.add(new BossProjectile(new PVector(pos.x, pos.y+dim.y/5), new PVector(10,10), new PVector(0,10), ship));
  }
  
  //DISPLAYING THE BOSS PROJECTILES ON THE SCREEN
  void renderBullets(){
    for(int i=0; i < bullets.size(); i++){
      BossProjectile Bb = bullets.get(i);
      Bb.drawMe();
      Bb.update();
      Bb.hit(ship);
      if(!Bb.isAlive) bullets.remove(i);
    }
  }
  
 //FUNCTION TO CHECK IF THE BOSS AND THE PLAYER COLLIDES 
 void resolveCollision(CharacterObject x){
   resolveDeath();
    if(super.hitCharacter(x)){
      if(x.health > 0 ){
        x.health -= 1;
        return;
      } 
    }
  }
  

  //ALLOWS THE BOSS TO WARP THROUGH WALLS 
  void checkWalls(){
    if(pos.x-dim.x/2 > width){
      pos.x =0;
    }
    
    if(pos.x+dim.x/2 < 0){
      pos.x = width;
    }
  }
  
  void resolveHit(){
    return;
  }
  
  //IF ENEMY DIES WE WANT TO MAKE IT STOP MOVING AND START THE FREEZE TIMER THAT DICTATES HOW LONG IT IS ON SCREEN
  void resolveDeath(){
    if(health <= 0){
      freezeTimer += 1;
      destroyed = true;
      vel.set(0,0);
      
    }
    
    if(health <= 0 && freezeTimer/60 > 3){
      isAlive = false;
    } 
  }
  
}
