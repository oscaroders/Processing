float tpf, time;
int currentTime, backgcount;

boolean firstItt;
PVector[] starPos;
int numberOfStars;

ObjectManager paul;

void setup(){
  size(1000, 500);
  firstItt = true;
  backgcount = 0;
  numberOfStars = 50;
  starPos = new PVector[numberOfStars];
  paul = new ObjectManager();
  paul.spawnDot("Steve");
}

void draw(){
  currentTime = millis();
  tpf = (currentTime - time) * 0.001f;
  drawBackground();

  paul.update();
  displayScore();

  if(firstItt){
    firstItt = false;
  }
  time = currentTime;
}
