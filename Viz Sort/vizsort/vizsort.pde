int[] randNums;
int strokeSize = 10;
ArrayList<Integer> nums = new ArrayList<Integer>();

void setup() {
  frameRate(200);
  size(1200, 600);
  clear();
  //Fill numbers
  float barHeight = height/(width/strokeSize);
  for (int i=0; i<width/strokeSize; i++)
    nums.add((i+1)*int(barHeight));

  //Create array w/ random numbers
  randNums = new int[width/strokeSize];
  for (int i=0; i<randNums.length; i++) {
    int randNum = int(random(nums.size()));
    randNums[i] = nums.get(randNum);
    nums.remove(randNum);
  }

  //Initial Draw
  /*translate(0, height);
   scale(1, -1);
   rectMode(CORNERS);
   noStroke();
   fill(255);
   //Draw array list
   for (int i=0; i<randNums.length; i++) {
   rect(strokeSize*i+1, 0, strokeSize*(i+1), randNums[i]);
   }*/
}

boolean menu = true;

int pos = 0;
boolean sorted = false;
int itr = 0;
int sortNum = 0;
boolean end = false;

int sortMode = 0;


void draw() {
  if (!menu) { //Start once sortMode is picked (Look at keyPressed)
    if (sorted) { //If sort is over, wait until SPACE pressed
      if (end)
        exit();
    } else { //Apply sort and display
      translate(0, height);
      scale(1, -1);
      rectMode(CORNERS);
      fill(0);

      //Applt sort based on selected mode
      switch(sortMode) {
      case 1:
        bubbleSort();
        break;
      case 2:
        insertionSort();
        break;
      default:
        println("ERROR - INVALID METHOD");
        break;
      }

      //Redraw
      if (!sorted) {
        redraw();
      }
      //Display iteration#
      scale(1, -1);
      itr++;
      textSize(25);
      stroke(255);
      text("Iteration: " + itr, 0, -height+25);

      noStroke();
    }
  }
}

void keyPressed() {
  if (menu) {
    if (key=='1' || key=='2') {
      sortMode = Integer.parseInt(Character.toString(key));
      if (sortMode==2) {
        pos=1;
        sortNum=1;
      }
      menu=false;
    }
  } else
    if (key==' ')
      end=true;
}

void redraw() {
  clear();
  fill(255);
  for (int i=0; i<randNums.length; i++)
    rect(strokeSize*i+1, 0, strokeSize*(i+1), randNums[i]);

  fill(255, 0, 0);
  rect(strokeSize*pos+1, 0, strokeSize*(pos+1), randNums[pos]);
  rect(strokeSize*(pos+1)+1, 0, strokeSize*(pos+2), randNums[pos+1]);
}

void finish() {
  clear();
  fill(0, 255, 0);
  for (int i=0; i<randNums.length; i++)
    rect(strokeSize*i+1, 0, strokeSize*(i+1), randNums[i]);

  sorted = true;
}

void bubbleSort() {  //Bubble sort
  //Show elements being compared
  fill(255, 0, 0);
  rect(strokeSize*pos+1, 0, strokeSize*(pos+1), randNums[pos]);
  rect(strokeSize*(pos+1)+1, 0, strokeSize*(pos+2), randNums[pos+1]);

  //Apply BSort
  if (randNums[pos+1]<randNums[pos]) {
    int temp = randNums[pos];
    randNums[pos] = randNums[pos+1];
    randNums[pos+1] = temp;
  }

  //Wrap/Check ends
  pos++;
  if (pos>=width/strokeSize-(1+sortNum)) {
    sortNum++;
    if (sortNum==width/strokeSize)
      finish();
    else
      pos = 0;
  }
}

int lookPos = 0;
int minPos = 0;

void insertionSort() { //Insertion Sort
  println(sortNum);

  //Show elements being compared
  fill(255, 0, 0);
  rect(strokeSize*pos+1, 0, strokeSize*(pos), randNums[pos]); //@ current min
  fill(0, 0, 255);
  rect(strokeSize*(pos-1)+1, 0, strokeSize*(pos-1), randNums[pos-1]); //@ current search

  pos--;

  if (pos==0) {
    pos=sortNum;
    sortNum++;
  }
  
  if (sortNum==width/strokeSize)
    finish();
  else {
    if (randNums[pos]<randNums[pos-1]) {
      int temp = randNums[pos];
      randNums[pos]=randNums[pos-1];
      randNums[pos-1]=temp;
    } else {
      pos=sortNum;
      sortNum++;
    }
  }
}
