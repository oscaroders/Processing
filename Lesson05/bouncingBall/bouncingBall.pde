float posY = 100;
float posX = 500;
OVector vec1 = new OVector(posX, posY);
float velocity = 160;
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
  vec1.yValue += velocity * tpf;
  vec1.xValue++;

  if(vec1.yValue > height){
    velocity *= -1;
    vec1.yValue = height - 1;
  }

  if(vec1.xValue > width){
    vec1.xValue = 0;
  }

  time = currentTime;
}

void drawSite(){
  background(255);
  ellipse(vec1.xValue, vec1.yValue, 10, 10);
}
