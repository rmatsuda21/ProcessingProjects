ArrayList<Struct> structs;
ArrayList<Button> btns;
ArrayList<Slider> sliders;

Box[][] grid = new Box[15][15];

int xOff = 0, yOff = 0;
int hovX = 0, hovY = 0;
int he=50;

Button hoverB;
Slider hoverS;

boolean sliderHolding = false;

int r=0, g=0, b=0;

void setup() {
  colorMode(RGB);
  size(700, 700);

  structs = new ArrayList<Struct>();
  btns = new ArrayList<Button>();
  sliders = new ArrayList<Slider>();

  //Init map grid
  for (int i=0; i<grid.length; i++) {
    for (int j=0; j<grid[i].length; j++) {
      grid[i][j] = new Box(i, j, 50);
    }
  }
  
  //Init buttons
  btns.add(new incrementBtn(600, 100, 5, "+"));
  btns.add(new incrementBtn(600, 150, -5, "-"));
  btns.add(new createTxtBtn(600, 400, "C"));
  //btns.add(new 
  //Init sliders
  sliders.add(new Slider(150, 255, 500, 500));
  sliders.add(new Slider(150, 255, 500, 525));
  sliders.add(new Slider(150, 255, 500, 550));
}

void draw() {
  r = sliders.get(0).value;
  g = sliders.get(1).value;
  b = sliders.get(2).value;
  clear();
  background(200);

  //Show color based on created structures
  for (Struct s : structs) {
    grid[s.x+xOff][s.y+yOff].setColor(s.c);
  }
  //Show grid
  for (int i=0; i<grid.length; i++) {
    for (int j=0; j<grid[i].length; j++) {
      grid[i][j].show();
    }
  }

  //Show height adjuster
  //Show buttons
  for (Button b : btns) {
    b.show();
  }
  //Show current height
  fill(255);
  text(he, 600, 148);

  //Color picker
  //Show slider
  for (Slider s : sliders) {
    s.show();
  }
  //Display color
  fill(r, g, b);
  rect(350, 500, 75, 75);
  
  //Side note: Should've made all objects extend from some sort of Interactable class
  //           so that I don't have to update buttons and sliders individually...
  //           too late I guess... Maybe in a future version.
}

void mouseMoved() {
  hovX = -1;
  hovY = -1;
  hoverB = null;
  hoverS = null;
  for (int i=0; i<grid.length; i++) {
    for (int j=0; j<grid[i].length; j++) {
      if (grid[i][j].mouseHover()) {
        hovX = i;
        hovY = j;
      }
    }
  }
  for (Button b : btns) {
    if (b.mouseHover()) {
      hoverB = b;
    }
  }
  for (Slider s : sliders) {
    if (s.mouseHover()) {
      hoverS = s;
    }
  }
}

void mousePressed() {
  if (hoverB!=null)
    hoverB.action();
  if (hoverS!=null)
    sliderHolding = true;
  else if (hovX!=-1) {
    if (!structExist(hovX+xOff, hovY+yOff)) {
      structs.add(new Struct(he, 25, hovX+xOff, hovY+yOff, r, g, b));
    } else {
      findStruct(hovX+xOff, hovY+yOff).update(he, color(r, g, b));
    }
  }
}

void mouseReleased() {
  if (sliderHolding) {
    sliderHolding = false;
  }
}

void mouseDragged() {
  if (sliderHolding && hoverS != null) {
    hoverS.updateValue();
  }
}

boolean structExist(int x, int y) {
  for (int i=0; i<structs.size(); i++) {
    if (structs.get(i).x==x&&structs.get(i).y==y) {
      return true;
    }
  }
  return false;
}

Struct findStruct(int x, int y) {
  for (Struct s : structs) {
    if (s.x == x && s.y == y)
      return s;
  }
  return null;
}
