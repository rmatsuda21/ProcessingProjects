int m=0;
int fR = 100;
int xi=0, yi=0;
float vel=0;
float ratio = 1/1;//Ratio from m:px
void setup(){
  frameRate(fR);
  size(500,500);
}

void draw(){
   int x = mouseX;
   int y = mouseY;
   int nm = millis();
   float dist = (sqrt(pow(xi-x,2)+pow(yi-y,2)));
   //println(dist);
   vel = (dist*ratio)/(nm-m);
   m = nm;
   xi = x;
   yi = y;
   println(vel);
}

void mouseMoved(){
   
}
