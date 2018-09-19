import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class manyBalls extends PApplet {

public class Ball{

  public PVector pos;
  public PVector velocity;
  float diam;
  int c;

  public Ball(PVector pos, PVector velocity, float diam, int c){
    this.diam = diam;
    this.velocity = velocity;
    this.c = c;
    this.pos = pos;
  }

  public void setPos(float x, float y){
    this.pos.set(x, y);
  }

  public void setVel(float x, float y){
    this.velocity.set(x, y);
  }

  public void drawBall(){
    noStroke();
    fill(c);
    ellipse(this.pos.x, this.pos.y, diam, diam);
  }

  public void move(){

    this.setVel(this.velocity.x, this.velocity.y + acceleration);
    this.setPos(this.pos.x + this.velocity.x * tpf, this.pos.y + this.velocity.y * tpf);

    if(this.pos.y > windowHeight){
      this.setVel(this.velocity.x, this.velocity.y * -1);
      this.setPos(this.pos.x, height - 1);
    }

    if(this.pos.x > windowWidth){
      this.setPos(0, this.pos.y);
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

public void setup(){
  
  frameRate(60);
  for(int i = 0; i < numberOfBalls; i ++){
    int c = color(random(128, 255), random(1, 255) , 15 * i);
    vecs[i] = new PVector(random(10, windowWidth -10), random(10, windowHeight - 10));
    vels[i] = new PVector(random(-50, 50), random(100, 200));
    balls[i] = new Ball(vecs[i], vels[i], diam, c);
  }
  //ball = new Ball(vec, vel, diam, c);
}

public void draw(){
  int currentTime = millis();
  tpf = (currentTime - time) * 0.001f;
  background(255);

  for(int i = 0; i < numberOfBalls; i++){
    drawSite(balls[i]);
  }



  time = currentTime;
}

public void drawSite(Ball ball){

  ball.drawBall();
  ball.move();
}
  public void settings() {  size(1000, 500); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "manyBalls" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
