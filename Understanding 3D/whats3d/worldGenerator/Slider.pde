class Slider {
  int value = 0;
  int maxValue;
  int len;
  int x, y;
  int sliderX;

  float xInc;

  color c = color(255);

  public Slider(int len, int maxValue, int x, int y) {
    this.len = len;
    this.maxValue = maxValue;
    this.x = x;
    this.y = y;
    xInc = float(maxValue)/float(len);
    sliderX = x;
  }

  public void show() {
    fill(255);
    rect(x, y, len, len/10);
    fill(c);

    rect(sliderX, y-len/40, len/8, len/8);
    fill(0);
    text(value, x-15-(12*Integer.toString(value).length()), y+15);
  }

  public void updateValue() {
    for (int i=0; i<len; i++) {
      if (mouseX<x+i+len/8) {
        if (i==0) {
          value = 0;
          sliderX = 0;
        } else {
          value = int(map(i, 0, len, 0, 225));
          sliderX = i+x;
          break;
        }
      }
    }
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
    return mouseX>sliderX && mouseX<=sliderX+len/8 && mouseY>y && mouseY<=y+len/8;
  }
}
