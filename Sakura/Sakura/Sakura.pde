//(255,183,197)
PImage petal;

void setup(){
  size(600,600, P3D);
  petal = loadImage("cherry.png");
}

float angle = 0;

void draw(){
  translate(width/2,height/2,0);
  scale(1,-1,1);
  angle++;
  clear();
  imageMode(CENTER);
  
  image(petal,100,100, 70, 50);
  
  rotateX(radians(angle));
  image(petal,0,0, 70, 50);
  rotateX(radians(-angle));
}

class Blossom{
  
}

/*void setup() {
  size(500, 500, P3D);
  noFill();
}

void draw() {
  background(0);
 
  pushMatrix();
  // start at the middle of the screen
  translate(width/2, height/2, -200);     
  // some random rotation to make things interesting
  rotateY(20.0); //yrot);
  rotateZ(30.0); //zrot);
  // rotate in X a little more each frame
  rotateX(frameCount / 100.0);
  // offset from center
  translate(0, 350, 0);
 
  // draw a white box outline at (0, 0, 0)
  stroke(255);
  box(50);
 
  // the box was drawn at (0, 0, 0), store that location
  float x = modelX(0, 0, 0);
  float y = modelY(0, 0, 0);
  float z = modelZ(0, 0, 0);
  // clear out all the transformations
  popMatrix();

  // draw another box at the same (x, y, z) coordinate as the other
  pushMatrix();
  translate(x, y, z);
  stroke(255, 0, 0);
  box(50);
  popMatrix();
} */
