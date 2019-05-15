abstract class Button {
  int x, y;
  String s;
  color c = color(255);

  public Button(int x, int y, String s) {
    this.x = x;
    this.y = y;
    this.s = s;
  }

  public Button(int x, int y) {
    this.x = x;
    this.y = y;
    this.s = "";
  }

  public void setColor(color c) {
    this.c = c;
  }

  public void show() {
    fill(c);
    rect(x, y, 25, 25);
    textSize(25);
    fill(0);
    text(s, x, y+20);
  }

  public boolean mouseHover() {
    if (mouseOver()) {
      c = color(150);
      return true;
    } else {
      c = color(255);
      return false;
    }
  }

  public boolean mouseOver() {
    return mouseX>x && mouseX<=x+25 && mouseY>y && mouseY<=y+25;
  }

  abstract void action();
}

class incrementBtn extends Button {

  int incVal = 0;

  public incrementBtn(int x, int y, int incVal, String s) {
    super(x, y, s);
    this.incVal = incVal;
  }

  public incrementBtn(int x, int y, int incVal) {
    super(x, y);
    this.incVal = incVal;
  }

  public void action() {
    he+=incVal;
    println(he);
  }
}

class createTxtBtn extends Button {
  public createTxtBtn(int x, int y, String s) {
    super(x, y, s);
  }

  public createTxtBtn(int x, int y) {
    super(x, y);
  }

  public void action() {
    PrintWriter output = createWriter("structs.txt");

    for (Struct s : structs)
      output.println(s.toString());

    output.flush();
    output.close();
  }
}
