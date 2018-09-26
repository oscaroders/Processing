float tpf;
float time;
int endTime;
int currentTime;

CharacterManager ralf;

void setup(){
  size(1500, 1000);
  endTime = 0;
  ralf = new CharacterManager(300);
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
