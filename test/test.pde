ArrayList<Toothpick> picks = new ArrayList<Toothpick>();
ArrayList<Toothpick> next = new ArrayList<Toothpick>();

int pickNum = 1;

void setup(){
  size(1000,1000);
  translate(width/2,height/2);
  for(int i=0;i<pickNum;i++){
    picks.add(new Toothpick(0,0,20,false));
    next.add(picks.get(0));
    picks.get(i).show();
  }
  drawNext();
}

void draw(){
  translate(width/2,height/2);
}

void mousePressed(){
  drawNext();
}

void drawNext(){
  
  ArrayList<Toothpick> tempPicks = new ArrayList<Toothpick>();
  for(int i=0;i<next.size();i++){
    Toothpick[] newPicks = next.get(i).createNewPicks(picks);
    for(int j=0;j<2;j++)
      if(newPicks[j]!=null){
        tempPicks.add(newPicks[j]);
      }
  }
  next = tempPicks;
  //println("Next: " + next.size());
  //println("Picks: " + picks.size());
}
