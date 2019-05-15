class Box {
  int x, y, offset;

  color c = color(255);

  public Box(int x, int y, int offset) {
    this.x = x;
    this.y = y;
    this.offset = offset;
  }

  public void setColor(color c) {
    this.c = c;
  }

  public void show() {
    fill(c);
    rect(x*25+1+offset, y*25+1+offset, 25, 25);
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
    return mouseX>x*25+offset && mouseX<=(x+1)*25+offset && mouseY>y*25+offset && mouseY<=(y+1)*25+offset;
  }
}
