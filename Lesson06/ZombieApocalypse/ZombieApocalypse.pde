float tpf;
float time;
int endTime;
int currentTime;

CharacterManager ralf;

void setup(){
  size(1000, 1000);
  endTime = 0;
  ralf = new CharacterManager(99);
  ralf.spawn();
}

void draw(){
  currentTime = millis();
  tpf = (currentTime - time) * 0.001f;
  background(210);

  ralf.update();

  gameOver();

  time = currentTime;
}
