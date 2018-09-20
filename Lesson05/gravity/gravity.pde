float tpf;
float time;

int numberOfBalls = 500;
SpaceBall[] balls;
Planet planet;
//SpaceBall ball;

void setup(){
  size(1000, 1000);
  balls = new SpaceBall[numberOfBalls];
  for(int i = 0; i < numberOfBalls; i++){
    balls[i] = new SpaceBall();
  }
  //ball = new SpaceBall(1,1);
  planet = new Planet(width / 2, height / 2);
}

void draw(){
  int currentTime = millis();
  tpf = (currentTime - time) * 0.001f;
  background(255);

  planet.draw();

  for(int i = 0; i < numberOfBalls; i++){
    balls[i].draw();
  }

  //ball.draw();

  time = currentTime;
}
