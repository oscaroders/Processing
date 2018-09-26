public class Ball{

  public PVector pos;
  public PVector velocity;
  float diam;
  color c;

  public Ball(PVector pos, PVector velocity, float diam, color c){
    this.diam = diam;
    this.velocity = velocity;
    this.c = c;
    this.pos = pos;
  }

  void setPos(float x, float y){
    this.pos.set(x, y);
  }

  void setVel(float x, float y){
    this.velocity.set(x, y);
  }

  void drawBall(){
    noStroke();
    fill(c);
    ellipse(this.pos.x, this.pos.y, diam, diam);
  }

  void move(){

    this.setVel(this.velocity.x, this.velocity.y + acceleration);
    this.setPos(this.pos.x + this.velocity.x * tpf, this.pos.y + this.velocity.y * tpf);


    if(this.pos.y > windowHeight){
      this.setVel(this.velocity.x, this.velocity.y * -1);
      this.setPos(this.pos.x, height - 1);
    }

    if(this.pos.x > windowWidth){
      this.setPos(0, this.pos.y);
    }

    if(this.pos.x < 0){
      this.setPos(windowWidth, this.pos.y);
    }
  }


}

//variable declarations ---------------------------------------------------------------

float windowWidth = 1000;
float windowHeight = 500;
float tpf;
float time;

//PVector vec = new PVector(500, 100);
//PVector vel = new PVector(50, 160);
float diam = 10;
//color c = color(255, 0, 0);
float acceleration = 50;
int numberOfBalls = 20;

PVector vecs[] = new PVector[numberOfBalls];
PVector vels[] = new PVector[numberOfBalls];
Ball balls[] = new Ball[numberOfBalls];
//Ball ball;

void setup(){
  size(1000, 500);
  frameRate(60);
  for(int i = 0; i < numberOfBalls; i ++){
    color c = color(random(128, 255), random(1, 255) , 15 * i);
    vecs[i] = new PVector(random(10, windowWidth -10), random(10, windowHeight - 10));
    vels[i] = new PVector(random(-50, 50), random(100, 200));
    balls[i] = new Ball(vecs[i], vels[i], diam, c);
  }
  //ball = new Ball(vec, vel, diam, c);
}

void draw(){
  int currentTime = millis();
  tpf = (currentTime - time) * 0.001f;
  background(255);

  for(int i = 0; i < numberOfBalls; i++){
    drawSite(balls[i]);
  }

  time = currentTime;
}

void drawSite(Ball ball){

  ball.drawBall();
  ball.move();
}
