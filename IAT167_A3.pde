
// CREATING THE FRAME, BACKGROUND AND FONTS
Frame frame;
Score score;
PImage backImg;
PImage instructionImg1;
PImage instructionImg2;
PFont font;

//DECLARING CLOUD ARRAY 
ArrayList<Cloud> clouds = new ArrayList<Cloud>();

//DECLARING ENEMY ARRAY
ArrayList<BasicEnemy> enemyList = new ArrayList<BasicEnemy>();

//BUTTONS USED IN THE MENU
MenuObject startButton;
MenuObject instructionButton;
MenuObject menuButton;
MenuObject nextButton;
MenuObject prevButton;

//DECLARING PLAYER AND BOSS OBJECT
Player ship;
BossEnemy boss;

int gameState;
int bossTimer = 0;
int earthsHealth = 10;

//DEFAULT VALUES
int defaultBossHealth = 8;
int defaultPlayerHealth = 10;
PVector defaultPlayerPosition = new PVector(300, 800);
int defaultEarthHealth = 10;
int defaultScoreValue = 1;



/*--------------------------------------> SETUP <----------------------------*/


void setup(){
  size(600,850);
  //INTITIALIZING FONT, BACKGROUND AND FRAME
  font = createFont("Assets/ValiantTimesExpandedItalic-d9l3E.otf", 70);
  textFont(font);
  backImg = loadImage("Assets/background.png");
  backImg.resize(600,850);
  
  instructionImg1 = loadImage("Assets/instructions.jpg");
  instructionImg1.resize(600,850);
  
  instructionImg2 = loadImage("Assets/aboutBoss.jpg");
  instructionImg2.resize(600,850);
  
  frame = new Frame();
  score = new Score();
  gameState = 0;
  
  //INTITIALIZING MENU BUTTONS
  startButton = new MenuObject(new PVector(200, 50), new PVector(200,400), 3, "Click to Play");
  instructionButton = new MenuObject(new PVector(200, 50), new PVector(200,500), 1, "Instruction Page");
  menuButton = new MenuObject(new PVector(200, 50), new PVector(200,800), 0, "Back to Menu");
  nextButton = new MenuObject(new PVector(200, 50), new PVector(400,0), 2, "NEXT");
  prevButton = new MenuObject(new PVector(200, 50), new PVector(0,0), 1, "PREV");
  
  //INTIALIZING THE PLAYER AND BOSS OBJECT
  ship = new Player(defaultPlayerHealth, defaultPlayerPosition, new PVector(70,50), new PVector());
  boss = new BossEnemy(defaultBossHealth, new PVector(300,200), new PVector(100,60), new PVector(0,0));
}


/*--------------------------------------> DRAW <----------------------------*/


void draw(){
  switch(gameState){
  case 0:
    menu();
    return;
  case 1:
    instructionsPg1();
    return;
  case 2:
    instructionsPg2();
    return;
  case 3:
    gameplay();
    addFrame();
    return;
  case 4:
    gameOver();
    return;
   default:
     return;
  }
}


/*--------------------------------------> GAME STATES && MENU BUTTONS <----------------------------*/

//GAMEPLAY STATE
void gameplay(){
  noTint();
  image(backImg,0,0);
  
  
  getEnemies();
  showEnemies();
  getClouds();
  
  
  ship.drawMe();
  ship.update();
  
  if(timeForBoss()) addBoss(); 
  
  if(left) ship.accelerate(leftAcc);
  if(right) ship.accelerate(rightAcc);
  if(up) ship.accelerate(upAcc);
  if(down) ship.accelerate(downAcc);
  
  incrementBossTimer();
  checkLost();
}

//GAME OVER STATE
void gameOver(){
  background(255,248,234);
  fill(35,31,31);
  textSize(80);
  text("Game Over!", 150,height/4);
  
  textSize(30);
  text("Your score is: "+ score.score/30, 220,height/4 + 80);
  startButton.display();
  if(startButton.onClick()){
    startButton.update();
    resetGame();
  }
  
  instructionButton.display();
  instructionButton.update();
}

//MAIN-MENU STATE
void menu(){
  background(255,248,234);
  textSize(80);
  text("ALIEN BLSTR!!!", 100,height/4);
  startButton.display();
  startButton.update();
  
  instructionButton.display();
  instructionButton.update();
}

//INSTRUCTIONS STATE 1
void instructionsPg1(){
   image(instructionImg1,0,0);
   menuButton.display();
   menuButton.update();
   nextButton.display();
   nextButton.update();
}

//INSTRUCTIONS STATE 2
void instructionsPg2(){
   image(instructionImg2,0,0);
   menuButton.display();
   menuButton.update();
   prevButton.display();
   prevButton.update();
}
