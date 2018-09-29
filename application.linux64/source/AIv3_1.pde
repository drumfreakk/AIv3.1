
//-------------------------------------------------------------------------------------------------
//EDITABLE
//-------------------------------------------------------------------------------------------------

//max steps dots are allowed to take
int maxSteps = 1000;

//gens to new goal pos
int genToNew = 5;


//positions the goal can have
int maxGoalSteps = 4;

//positions of the goal
int[][] goals = {{600, 400}, {450, 325}, {220, 260}, {400, 10}};

//size of the population
int popuSize = 1000;

//framerate
int framerate = 500;

//background colour
int backG = 255;

//text color
int textC = 0;


//another small editable bit in Wall


//-------------------------------------------------------------------------------------------------
//PREFERABLY NON-EDITABLE
//-------------------------------------------------------------------------------------------------

Population popu;
Wall walls;
Goal cGoal;

int genSinceHit = 0;

int goalSteps = 0;

void setup() {
  size(800, 800); //size of the window
  frameRate(framerate);//increase this to make the dots go faster
  popu = new Population(popuSize, maxSteps);//create a new population with 1000 members
  walls = new Wall();
  cGoal = new Goal();

  cGoal.setP(goals[0][0], goals[0][1]);  

}


void draw() { 
  background(backG);
  
  fill(textC);
  text("gen: "+str(popu.gen), 10, 10, 70, 80);  // Text wraps within text box

  //draw goal
  cGoal.show();
  walls.show();

  
  if (popu.allDotsDead()) {
    
    boolean hitGoal = popu.hitGoal();
    
    //genetic algorithm
    popu.calculateFitness();
    popu.naturalSelection();
    popu.mutateDemBabies();
    
    if(hitGoal && goalSteps < (maxGoalSteps + 1)){
      genSinceHit++;
      
      //move goal
      if(genSinceHit == genToNew && goalSteps < (maxGoalSteps-1)){
        genSinceHit = 0;
        goalSteps++;
        popu.minStep = maxSteps;
        cGoal.setP(goals[goalSteps][0], goals[goalSteps][1]);
      }
    }
  } else {
    //if any of the dots are still alive then update and then show them

    popu.update();
    popu.show();
  }
}
