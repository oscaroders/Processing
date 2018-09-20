float tpf;
float time;

CharacterManager ralf;

void setup(){
  size(500,500);
  ralf = new CharacterManager(99);
  ralf.spawn();
}

void draw(){
  int currentTime = millis();
  tpf = (currentTime - time) * 0.001f;
  background(255);

  ralf.update();

  time = currentTime;
}
