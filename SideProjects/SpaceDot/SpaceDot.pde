float tpf, time;
int currentTime, backgcount, endTime;

boolean firstItt, gameOver;
PVector[] starPos;
int numberOfStars, numberOfMissiles;

ObjectManager paul;

void setup(){
  size(1900, 1000);
  firstItt = true;
  gameOver = false;
  endTime = 0;
  backgcount = 0;
  numberOfStars = 500;
  starPos = new PVector[numberOfStars];
  paul = new ObjectManager();
  paul.spawnDot("Steve");
  numberOfMissiles = 60;
  paul.spawnMissile(numberOfMissiles);
}

void draw(){
  currentTime = millis();
  tpf = (currentTime - time) * 0.001f;
  drawBackground();

  paul.update();
  displayScore();
  gameOver();

  if(firstItt){
    firstItt = false;
  }
  time = currentTime;
}
