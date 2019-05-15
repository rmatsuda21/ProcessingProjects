class Toothpick{
  float x,y;
  float[][] ends = new float[2][2];
  float len;
  boolean vert;
  
  public Toothpick(float x, float y, float len, boolean vert){
    this.x = x;
    this.y = y;
    this.len = len;
    this.vert = vert;
    ends[0] = !vert ? new float[]{x-len/2,y} : new float[]{x,y-len/2};
    ends[1] = !vert ? new float[]{x+len/2,y} : new float[]{x,y+len/2};
  }
  
  public void show(){
    if(vert)
      line(x, y-len/2,x,y+len/2);
    else
      line(x-len/2,y,x+len/2,y);
  }
  
  public Toothpick[] createNewPicks(ArrayList<Toothpick> picks){
    //First pick
    Toothpick pick1 = createPick(picks, ends[0][0], ends[0][1]);
    Toothpick pick2 = createPick(picks, ends[1][0], ends[1][1]);
    if(pick1 != null){
      pick1.show();
      picks.add(pick1);
    }
    if(pick2 != null){
      pick2.show();
      picks.add(pick2);
    }
    return new Toothpick[] {pick1, pick2};
  }
  
  private Toothpick createPick(ArrayList<Toothpick> picks, float x, float y){
    boolean canCreate = true;
    for(Toothpick pick: picks){
      if(this != pick){
        for(float[] cord:pick.ends){
          //println(cord[0] + " " + cord[1]);
          if(cord[0] == x && cord[1] == y){
            canCreate = false;
            break;
          }
        }
      }
      if(!canCreate)
        break;
    }
    if(canCreate){
      //println("POGGERS");
      Toothpick newPick = new Toothpick(x,y,len,!vert);
      return newPick;
    }
    //println("NOPE");
    return null;
  }
}
