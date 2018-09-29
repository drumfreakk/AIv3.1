class Goal{
  PVector goal  = new PVector(400, 10);
  Goal(){
  }
  
  void show(){
    fill(255,0,0);
    ellipse(goal.x, goal.y, 10, 10);

  }

  void setP(int x, int y){
    PVector wer = new PVector(x, y);
    goal.set(wer); 
  }
}
