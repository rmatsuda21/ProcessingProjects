final int SAMPLE_RATE = 440;

void setup(){
  size(500,500);
  ellipseMode(CENTER);
  translate(0,250);
  noLoop();
}

color[] cols = {color(255,0,0), color(0,255,0), color(0,0,255)};

void draw(){
  translate(0,250);
  for(int a=0;a<cols.length;a++){
    stroke(cols[a]);
    for(int i=0;i<500;i+=7){
       float x = 1./(500);
       float pitch = 1+a;
       float hz = 440* pitch;
       float y = sin(2*PI*x*i*hz/SAMPLE_RATE);
       float yscale = 250;
       fill(cols[a]);
       ellipse(i,y*yscale,5,5);
    }
  }
}
