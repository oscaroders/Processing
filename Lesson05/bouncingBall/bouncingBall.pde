float posY = 100;
float posX = 500;
float velocity = 100;
float acceleration = 2;
float tpf;
float time;

void setup(){
  size(1000, 500);
  frameRate(60);
}

void draw(){
  int currentTime = millis();

  tpf = (currentTime - time) * 0.001f;

  drawSite();

  velocity += acceleration;
  posY += velocity * tpf;

  if(posY > height){
    velocity *= -1;
    posY = height - 1;
  }

  time = currentTime;
}

void drawSite(){
  background(255);
  ellipse(posX, posY, 10, 10);
}
