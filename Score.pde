class Score{
  int score;
  int tSize;
  Score(){
    score = 60;
    tSize = 60;
  }
  
  void display(){
    int calcScore = score/30;
    fill(255,255,255);
    textSize(tSize);
    if(calcScore > 1000) textSize(50);
    text(calcScore, width-120, 70);
  }
  
  void update(){
    score += 1;
  }
}
