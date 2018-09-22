float tpf;
float time;

CharacterManager ralf;

void setup(){
  size(1000, 1000);
  ralf = new CharacterManager(99);
  ralf.spawn();
}

void draw(){
  int currentTime = millis();
  tpf = (currentTime - time) * 0.001f;
  background(210);

  ralf.update();

  time = currentTime;
}
