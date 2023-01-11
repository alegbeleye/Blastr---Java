
                                    /*--------------------------------------> GAMEPLAY FUNCTIONS <----------------------------*/

//ADDS NEW ENEMIES TO THE "enemyList" WHEN THE LIST SIZE IS < 5
void getEnemies(){
  if(enemyList.size() < 5){
    int health;
    for(int i=0; i < 5; i++){
      health = (int)random(2,3);
      BasicEnemy e = new BasicEnemy(health, new PVector(random(30, width-30), random(-200, 0)), new PVector(30,35).mult(health), new PVector(0, random(1,5)));
      enemyList.add(e);
    }
  }
}

//RENDER ALL THE CLOUDS IN THE LIST
void getClouds(){
  if(clouds.size() < 3){
    for(int i=0; i < 3; i++){
      Cloud c = new Cloud(new PVector(random(0, width), random(-200, 0)), new PVector(0, random(3,5)));
      clouds.add(c);
    }
  }
  for(int i=0; i < clouds.size(); i++){
      Cloud c = clouds.get(i);
      c.drawMe();
      c.update();
      if(!c.isAlive) clouds.remove(i);
    }
}

//RENDER ALL THE ENEMIES IN THE LIST
void showEnemies(){
  for(int i=0; i < enemyList.size(); i++){
      BasicEnemy e = enemyList.get(i);
      e.drawMe();
      e.update();
      e.resolveCollision(ship);
    }
}

//ADDS THE BOSS TO THE GAMEPLAY SCENE WHEN ITS TIME
void addBoss(){
  boss.drawMe();
  boss.update();
  checkBossDefeated(boss);
}

//ADDS FRAME TO THE GAMEPLAY SCENE WHEN ITS TIME [ THIS INCLUDES THE PLAYER, EARTH AND BOSS HEALTH BAR ]
void addFrame(){
    frame.display();
    score.display();
    score.update();
}

// CHECK IF THE BOSS HAS BEEN DEFEATED
void checkBossDefeated(BossEnemy x){
  if(!x.isAlive && x.freezeTimer/60 > 1){
    bossTimer = 0;
    boss.health = 8;
    
    x.isAlive = true;
    x.destroyed = false;
    x.freezeTimer = 0;
  }
}

//CHECKS IF THE PLAYER HAS LOST [ IF THE PLAYER OR THE EARTH IS OUT OF LIVES ] - WE SET THE GAME STATE TO 1 IF TRUE
void checkLost(){
  if (ship.health <= 0 || earthsHealth <=0){
    //CHANGING THE GAMESTATE TO THE GAME OVER SCREEN
    gameState = 4;
  }
}

//CHECKS IF IT IS TIME TO ADD THE BOSS
boolean timeForBoss(){
    if(bossTimer/60 > 10) return true;
    return false;
}

//INCREMENT BOSS TIMER
void incrementBossTimer(){
     bossTimer += 1;
}


//RESET THE GAMEPLAY STATE - TO BE CALLED AFTER PLAYER HAS LOST
void resetGame(){
  enemyList.clear();
  ship.health = defaultPlayerHealth;
  ship.pos = defaultPlayerPosition;
  boss.health = defaultBossHealth;
  earthsHealth = defaultEarthHealth;
  bossTimer = 0;
  score.score = defaultScoreValue;
}
