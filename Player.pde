class Player extends CharacterObject{
  ArrayList<Projectile> bulletList = new ArrayList<Projectile>();
  float damp;
  
  Player(int health, PVector pos, PVector dim, PVector vel){
    super(health, pos, dim, vel);
    damp = .8;
  }
  
  void drawMe(){
    pushMatrix();
    translate(pos.x, pos.y);
    stroke(35,31,32);
    fill(35,31,32);
    quad(0,0, -dim.x/2, dim.y/2, -dim.x/2, 0, 0, -dim.y/2); 
    quad(0,0, dim.x/2, dim.y/2, dim.x/2, 0, 0, -dim.y/2); 
    translate(0, 0+dim.y/2/2);
    quad(0,0, -dim.x/3, dim.y/2/2, -dim.x/3, 0, 0, -dim.y/2); 
    quad(0,0, dim.x/3, dim.y/2/2, dim.x/3, 0, 0, -dim.y/2); 
    popMatrix();
  }
  
  void update(){
    super.update();
    vel.mult(damp);
    resolveDeath();
    for(int i=0; i < bulletList.size(); i++){
         Projectile bullet = bulletList.get(i);
         bullet.update();
         bullet.drawMe();
         if(timeForBoss()) bullet.hit(boss);
         
         for(int j =0; j < enemyList.size(); j++){
           BasicEnemy e = enemyList.get(j);
           bullet.hit(e);
         }
     if(!bullet.isAlive) bulletList.remove(i);
  }
  
  }
  
  //FUNCTION TO SHOOT
  void shoot(){
    bulletList.add(new Projectile(new PVector(pos.x-dim.x/4, pos.y), new PVector(7,7), new PVector(0, -10)));
    bulletList.add(new Projectile(new PVector(pos.x+dim.x/4, pos.y), new PVector(7,7), new PVector(0, -10)));
  }
  
  //SET isAlive TO FALSE IF PALYER HEALTH IS 0
  void resolveDeath(){
    if(health <= 0){
      isAlive = false;
    } 
  }
  
}
