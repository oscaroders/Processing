boolean firstItt;
PVector[] starPos;
int numberOfStars;
int backgcount;

void setup(){
  size(1000, 500);
  firstItt = true;
  backgcount = 0;
  numberOfStars = 50;
  starPos = new PVector[numberOfStars];
}

void draw(){
  drawBackground();

  if(firstItt){
    firstItt = false;
  }
}
