void setup(){
  size(1000,1000);
  color[] pallete = {color(255,0,0), color(0,255,0),color(18, 221, 255), color(0,0,255), color(50,125,200), 
                       color(184,25,130),color(18, 221, 255), color(104,102,230), color(16, 15, 124), 
                       color(153, 153, 10), color(118,118,118),color(18, 221, 255), color(153, 38, 38), 
                       color(18, 221, 255), color(250, 192, 0), color(240, 230, 41),color(18, 221, 255)};
  float size = 1000;
  float ulx=0, uly=0;
  stroke(pallete[0]);
  line(ulx,uly,ulx+size,uly);
  line(ulx+size,uly, ulx+size,uly+size);
  line(ulx+size,uly+size, ulx, uly+size);
  line(ulx, uly+size, ulx, uly);
  persianRug(pallete, size, ulx, uly, 0,0,0,0);
}

int fibbonacci(int j){
   if(j<=1)
     return 1;
   if(j==2)
     return 1;
   return j+fibbonacci(j-1);
}

int getColor(long n, long e, long s, long w, int l){
    //long c = (long)pow(2,fibbonacci((int)(n+e+s+w)));
    long c = fibbonacci((int)(n+e+s+w));
    long offset = 6;
    return (int)(abs((c+offset)%l));
}

void persianRug(color[] pallete, float size, float ulx, float uly, long north, long east, long south, long west){
   if(size<1) //Base Case
     return;
   int c = getColor(north, east, south, west, pallete.length);
   stroke(pallete[c]);
   line(ulx+size/2, uly, ulx+size/2, uly+size);
   line(ulx, uly+size/2, ulx+size, uly+size/2);
   //Top left
   persianRug(pallete, size/2, ulx, uly, north, c, c, west);
   //Top right
   persianRug(pallete, size/2, ulx+size/2, uly, north, east, c, c);
   //Bottom right
   persianRug(pallete, size/2, ulx+size/2, uly+size/2, c, east, south, c);
   //Bottom left
   persianRug(pallete, size/2, ulx, uly+size/2, c, c, south, west);
}
