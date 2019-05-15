ArrayList<Ball> balls = new ArrayList<Ball>();
stopButton button = new stopButton(new PVector(540,565), new PVector(75,25));
float numBalls = 100;

PVector gravity = new PVector(0,-9.8);

//Frame Rate
float fr = 400;
int oldMil;
int avgCount = 50;
float count = 0;
float avgFPS = 0;
float sumTime = 1;

//World Setting (Time Scale... etc)
float scale = 1.0;

void setup(){
  textSize(20);
  fill(255);
  oldMil = millis();
  frameRate(fr);
  size(600,600);
  float ballRad = 5;
  for(int i=0;i<numBalls;i++){
    balls.add(new Ball(300, 1, ballRad, new PVector(0,1500), new PVector(ballRad+(ballRad+2)*i, 50+10*i)));
  }
}

void draw(){
  //Refresh screen
  clear();
  
  //Calculate true fps=====
  count++;
  int newMil = millis();
  sumTime += newMil - oldMil;
  oldMil = millis();
  
  if(count == avgCount){
    avgFPS = avgCount/(sumTime/1000.0);
    count = 0;
    sumTime = 0;
  }
  
  text("Frame Rate: " + avgFPS, 0,20);
  //======
  
  //Setup window space
  rectMode(CENTER);
  translate(0, height); //Set bottom-left to (0,0)
  scale(1,-1);
  
  //Apply forces=====
  for(Ball ball:balls){
    ball.force(scale, new PVector(gravity.x, gravity.y*(1/fr)));
  }
  //========
  
  //Move objects based on forces=====
  for(Ball ball:balls){
    ball.move(scale, fr);
  }
  //========
  
  //Display objects=====
  for(Ball ball:balls){
    ball.show();
  }
  button.show();
  //========
}

void changeTScale(float newScale){
  scale = newScale;
}

void keyPressed(){
  //Change scale
  if(key == ' '){
    stopMotion();
  }
  else if(key == '='){
    scale++;
  }
  else if(key == '-'){
    if(scale>1){
      scale--;
    }
  }
  //=====
  
  
}

//Change time scale
float tempScale = 0;
void stopMotion(){
  if(tempScale == 0){
      tempScale = scale;
      changeTScale(0);
    }
    else {
      changeTScale(tempScale);
      tempScale = 0;
    }
}

void mouseMoved(){
  if(button.mouseWithin())
    button.col = 180;
  else
    button.col = 130;
}

void mousePressed(){
  if(button.mouseWithin())
    button.action();
}
