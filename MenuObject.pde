class MenuObject{
  int setState;
  PVector dim;
  PVector pos;
  String placeholder;
  MenuObject(PVector dim, PVector pos, int ssoc, String placeholder){
    this.dim = dim;
    this.pos = pos;
    this.setState = ssoc;
    this.placeholder = placeholder;
  }
  
  void display(){
    noStroke();
    fill(35, 31, 32);
    rect(pos.x, pos.y+7, dim.x,dim.y);
    fill(255);
    rect(pos.x, pos.y, dim.x,dim.y);
    fill(35,31,32);
    textSize(dim.x/8);
    text(placeholder, pos.x + 10, pos.y+35);
  }
  
  void update(){
    if(onClick()) gameState = setState;
  }
 
  //FUNCTION TO CHECK IF THE MENU OBJECT HAS BEEN CLICKED  
  boolean onClick(){
    if(mousePressed){
      if(mouseX > pos.x-dim.x && mouseX < pos.x+dim.x){
        if(mouseY > pos.y-dim.y && mouseY < pos.y+dim.y){
          return true;
        }
      }
    }
    return false;
  }  
}
