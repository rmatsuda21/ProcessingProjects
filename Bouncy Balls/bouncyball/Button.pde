//Button will always be anchored to center
//Makes things easier, may add more anchor points later
/*void mouseDragged(){
 println("LOL");
 if(mouseWithin())
 col = 180;
 }
 
 void mousePressed(){
 if(mouseWithin())
 action();
 }*/

abstract class Button {
  PVector position;
  PVector size;


  public float col = 130;

  public Button(PVector position, PVector size) {
    this.position = position;
    this.size = size;
  }

  public boolean mouseWithin() {
    return mouseX<position.x+size.x/2.0 && mouseX>position.x-size.x/2.0 && height-mouseY<position.y+size.y/2 && height-mouseY>position.y-size.y/2;
  }

  public void show() {
    fill(col);
    rect(position.x, position.y, size.x, size.y);
    fill(255);
  }

  abstract void action();
}

class stopButton extends Button {

  public stopButton(PVector position, PVector size) {
    super(position, size);
  }

  public void action() {
    stopMotion();
  }
}
