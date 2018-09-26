float tpf, time;
int currentTime, backgcount;

boolean firstItt;
PVector[] starPos;
int numberOfStars;

Dot dot;

void setup(){
  size(1000, 500);
  firstItt = true;
  backgcount = 0;
  numberOfStars = 50;
  starPos = new PVector[numberOfStars];
  dot = new Dot("Steve");
}

void draw(){
  currentTime = millis();
  tpf = (currentTime - time) * 0.001f;
  drawBackground();

  dot.update();

  if(firstItt){
    firstItt = false;
  }
  time = currentTime;
}
