class Frame{
  PImage frame;
  PImage earthIcon;
  PImage heartIcon;
  float transparency;
  Frame(){
    frame = loadImage("Assets/Frame.png");
    earthIcon = loadImage("Assets/earthIcon.png");
    heartIcon = loadImage("Assets/heartIcon.png");
    frame.resize(600, 850);
    earthIcon.resize(30,30);
    heartIcon.resize(30,30);
    transparency = random(100,200);
  }
  
  void display(){
    strokeWeight(2);
    
    /*--------------------------------------> Health Bar Containers <----------------------------*/
    //Health Bar container
    stroke(255,255,255);
    fill(230,230,230);
    rect(width-102, 100, 15, 200);
    
    //Earth Health Bar container
    stroke(255,255,255);
    fill(230,230,230);
    rect(width-60, 100, 15, 200);
    

    
    /*--------------------------------------> Health Bars <----------------------------*/
    //Health Bar
    stroke(140,0,36);
    fill(194,0,14);
    rect(width-102, 100, 15, ship.health*20);
    
    
    //Earth Health Bar
    stroke(51,181,74);
    fill(141,198,63);
    rect(width-60, 100, 15, earthsHealth*20);
    
    
    /*--------------------------------------> BOSS's HEALTH BAR AND HEALTH CONTAINER <----------------------------*/
    
    if(timeForBoss()){
    //Boss Health Bar Container
    stroke(255,255,255);
    fill(230,230,230);
    rect(20, 20, 400, 15);
    
    //Boss Health Bar
    stroke(38,34,98);
    fill(113,21,255);
    rect(20, 20, boss.health*50, 15);
    }
    
    tint(255,255,255, transparency);
    image(frame,0,0);
    noTint();
    image(earthIcon, width-65, height/3+50);
    image(heartIcon, width-110, height/3+50);
  }
}
