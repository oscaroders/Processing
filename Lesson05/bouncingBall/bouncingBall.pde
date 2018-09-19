float posY = 100;
float posX = 500;
PVector vec1 = new PVector(posX, posY);
float velocityY = 160;
float velocityX = 50;
PVector velocity = new PVector(velocityX, velocityY);
float acceleration = 50;
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

  velocity.set(velocity.x, velocity.y + acceleration);
  vec1.y += velocity.y * tpf;
  vec1.x = vec1.x + velocity.x * tpf;

  if(vec1.y > height){
    velocity.y *= -1;
    vec1.y = height - 1;
  }

  if(vec1.x > width){
    vec1.set(0, vec1.y);
  }

  time = currentTime;
}

void drawSite(){
  background(255);
  ellipse(vec1.x, vec1.y, 10, 10);
}
