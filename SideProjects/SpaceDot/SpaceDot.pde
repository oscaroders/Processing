boolean firstItt;
PVector[] starPos;
int numberOfStars ;

void setup(){
  size(1000, 500);
  firstItt = true;
  numberOfStars = 10;
  starPos = new PVector[numberOfStars];
}

void draw(){

  if(firstItt){
    firstItt = false;
  }
}
