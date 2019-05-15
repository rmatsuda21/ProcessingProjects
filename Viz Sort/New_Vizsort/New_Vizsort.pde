int[] arr;
final int size = 100;
int strokeSize;

int w = 1000;
int h = 500;

void setup(){
  
  size(1000,500);
  
  strokeSize = (int)width/size;
  arr = new int[size];
  
  //Create array w/ numbers 1-size randomly shuffled
  ArrayList<Integer> nums = new ArrayList<Integer>();
  for(int i=1;i<=size;++i)
   nums.add(i); 
   
  for(int i=0;i<size;++i){
    int randNum = int(random(nums.size()));
    arr[i] = nums.get(randNum);
    nums.remove(randNum);
  }
  
  dispArrBar();
}

void draw(){
   
}

void dispArrBar(){
  for(int i=0;i<size;++i){
    
  }
}

void bubbleSort(){
   
}
