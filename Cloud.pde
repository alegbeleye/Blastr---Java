class Cloud{
  PImage cloud;
  float transparency;
  PVector pos;
  PVector vel;
  boolean isAlive;
  
  Cloud(PVector pos,PVector vel){
    this.pos = pos;
    this.vel = vel;
    cloud = loadImage("Assets/clouds.png");
    cloud.resize(134, 68);
    isAlive = true;
    transparency = random(100,200);
  }
  
  void drawMe(){
    pushMatrix();
    translate(pos.x,pos.y);
    tint(255,255,255, transparency);
    image(cloud, 0,0);
    popMatrix();
  }
  
  void update(){
    move();
    handleWalls();
  }
  
  void move(){
    pos.add(vel);
  }
  
  void handleWalls(){
    if(pos.y-68/2 > height) isAlive = false;
  }
}
