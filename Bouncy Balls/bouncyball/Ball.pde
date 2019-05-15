class Ball{
  PVector velocity;
  PVector position;
  
  float radius;
  
  float mass;
  float bounciness;
  
  public Ball(float mass, float bounciness, float radius, PVector initVel, PVector initPos){
    this.mass = mass;
    this.bounciness = bounciness;
    this.radius = radius;
    velocity = initVel;
    position = initPos;
  }
  
  //Apply force
  public void force(float scale, PVector force){
    velocity.add(force.mult(mass * scale));
    //println(velocity);
  }
  
  public void force(PVector force){
    velocity.add(force.mult(mass));
    //println(velocity);
  }
  
  //Handles movement of ball based on velocity
  public void move(float scale, float fr){
    position.add(new PVector(velocity.x, velocity.y).mult(scale/fr));
    if(collision()){
      position.y = radius;
      velocity.y *= -1;
    }
  }

  //Display ball based on position
  public void show(){
    ellipse(position.x,position.y, radius, radius);
  }
  
  //Check collision
  private boolean collision() {
    if(position.y<radius)
      return true;
    return false;
  }
}
