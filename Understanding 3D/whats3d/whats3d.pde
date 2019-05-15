ArrayList<int[]> data;

void setup() {
  size(900, 900, P3D);
  colorMode(RGB);
  //Obtain data from txt file
  //Created from map generation program (World Generator)
  data = new ArrayList<int[]>();
  String[] lines = loadStrings("structs.txt");
  for (String s : lines) {
    String[] split = s.split(",");
    data.add(new int[]{Integer.parseInt(split[0]), 0, Integer.parseInt(split[1]), Integer.parseInt(split[3]), Integer.parseInt(split[2]), Integer.parseInt(split[3]), Integer.parseInt(split[4])});
  }
}

float lookY = 0;
float camRotX=0, camRotY=0, camRotZ=0;
float camX=-100, camY=-30, camZ=0;
float camFwd=0, camLeft=0, camDown=0;
float theta = 0, phi = 0;

float FOV = PI/4;
float nearClipDist = 0.01;

void draw() {
  clear();
  //Draw objects
  background(255);
  for (int[] pos : data) {
    pushMatrix();
    String c = binary(pos[6]);
    int a = unbinary(c.substring(0, 8));
    int r = unbinary(c.substring(8, 16));
    int g = unbinary(c.substring(16, 24));
    int b = unbinary(c.substring(24, 32));
    //println(a + " " + r + " " + g + " " + b);
    fill(r, g, b); //Add color later
    translate(pos[0], pos[1]-pos[4]/2, pos[2]);
    box(pos[3], pos[4], pos[5]);
    popMatrix();
  }

  //Camera work
  //"Look" calculation
  float centerX = cos(radians(theta)) * sin(radians(phi));
  float centerZ = sin(radians(theta)) * sin(radians(phi));
  float centerY = cos(radians(phi));
  camera(camX, camY, camZ, camX + centerX, camY + centerY, camZ + centerZ, 0, 1.0, 0);
  perspective(FOV, float(width)/float(height), nearClipDist, camZ*100.0);
  if (abs(lookY)>0) {
    theta+=lookY*5;
  }

  if (abs(camFwd)>0) {
    float offset = 0;
    if (camFwd>0)
      offset = 180;
    camX-=cos(radians(theta+offset))*5;
    camZ-=sin(radians(theta+offset))*5;
  }
  if (abs(camLeft)>0) {
    camX+=cos(radians(theta+(camLeft*90)))*5;
    camZ+=sin(radians(theta+(camLeft*90)))*5;
  }
  if (abs(camDown)>0)
    phi-=camDown*5;

  //println(mouseX + " " + mouseY);
}

void keyPressed() {
  if (keyCode==LEFT)
    lookY = -1;
  else if (keyCode==RIGHT)
    lookY = 1;

  if (keyCode == UP)
    camDown = -1;
  else if (keyCode == DOWN)
    camDown = 1;

  if (key=='w')
    camFwd=1;
  else if (key=='s')
    camFwd=-1;

  if (key=='a')
    camLeft=-1;
  else if (key=='d')
    camLeft=1;
}

void keyReleased() {
  if (keyCode==LEFT || keyCode==RIGHT) {
    lookY = 0;
  }
  if (keyCode==UP || keyCode==DOWN) {
    camDown = 0;
  }
  if (key=='w' || key=='s') {
    camFwd = 0;
  }
  if (key=='a' || key=='d') {
    camLeft = 0;
  }
}
