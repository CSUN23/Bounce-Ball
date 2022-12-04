Ball[] container = new Ball[100];

void setup(){
  size(600,800);
  background(255,255,0);
  //fill array with different objects created from the ball class
  for(int i=0;i<container.length;i++){
    float radius = (float) Math.random() * 39 + 1; //radius between 1-40
    double xSpeed = (double) Math.random() * -6 + 3; //xSpeed range: -3~3
    double ySpeed = (double) Math.random() * -6 + 3; //ySpeed range: -3~3
    // initialize and populate b array.
    // all ball objects have the same color
    Ball b = new Ball(color(100), color(200), radius, width/2.0, height/2.0, xSpeed, ySpeed);
    container[i] = b;
  }
  
  
}

// draw, update and bounce balls
void draw(){
  background(255,255,0);
  Ball lBall = findLargestBall(container);
  
  for(Ball b : container){
    b.display(b==lBall);
    b.move();
    b.checkCollision();
  }
  
 
  // call largest and set its color to a different color
  // than the other ball objects
}

//find largest ball
static Ball findLargestBall(Ball[] container){
  float lRadius = 0;
  Ball largest = container[0];
  for(Ball b: container){
    if(b.radius>lRadius){
      lRadius = b.radius;
      largest = b;
    }
  }
  return largest;
}

// returns Ball that has the largest radius
// return the first one if there are multiples. 
class Ball{
  //declare var
  color fc;
  color lc;
  float radius;
  float xPos;
  float yPos;
  double xSpeed;
  double ySpeed;
  
  //constructor 
  public Ball(color fc, color lc, float radius, float x, float y, double xS, double yS){
    this.fc = fc;
    this.lc = lc;
    this.radius = radius;
    xPos = x;
    yPos = y;
    xSpeed = xS;
    ySpeed = yS;
  }
  
  //display the ball
  void display(boolean largest){
    stroke(lc);
    if(largest){
      fill(255,0,0);
    }
    else{
      fill(0,0,255);
    }
    ellipse(xPos,yPos,2*radius,2*radius);
  }
  
  //move > updating the x and y position
  void move(){
    xPos+=xSpeed;
    yPos+=ySpeed;
  }
  
  public void checkCollision(){
      if(xPos<0 || xPos>600 || yPos<0 || yPos>800){
        xSpeed*=-1;
        ySpeed*=-1;
      }
    }
}
