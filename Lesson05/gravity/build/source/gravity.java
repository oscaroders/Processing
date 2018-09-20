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

public class gravity extends PApplet {

float tpf;
float time;

int numberOfBalls = 500;
SpaceBall[] balls;
Planet planet;
//SpaceBall ball;

public void setup(){
  
  balls = new SpaceBall[numberOfBalls];
  for(int i = 0; i < numberOfBalls; i++){
    balls[i] = new SpaceBall();
  }
  //ball = new SpaceBall(1,1);
  planet = new Planet(width / 2, height / 2);
}

public void draw(){
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
class Planet extends SpaceBall{

  float diam = 100;

  public Planet(){
    super();
  }

  public Planet(float x, float y){
    super(x, y);
  }

  public Planet(float x, float y, int c){
    super(x, y, c);
  }

  public void draw(){
    fill(c);
    noStroke();
    ellipse(position.x, position.y, diam, diam);
  }
}
class SpaceBall{

  PVector position;
  PVector velocity;
  int c;
  float diam = 10;
  float distanceBetweenX, distanceBetweenY;
  boolean timeToTurn;

  public SpaceBall(){
    position = new PVector();
    position.x = random(0, width);
    position.y = random(0, height);

    velocity = new PVector();
    velocity.x = random(1, 2);
    velocity.y = random(1, 2);

    c = color(random(10, 245),
              random(10, 245),
              random(10, 245));
  }

  public SpaceBall(int c){
    position = new PVector();
    position.x = random(0, width);
    position.y = random(0, height);

    velocity = new PVector();
    velocity.x = random(0.1f, 2);
    velocity.y = random(0.1f, 2);

    this.c = c;
  }

  public SpaceBall(float x, float y){
    position = new PVector(x, y);

    velocity = new PVector();
    velocity.x = random(0.1f, 2);
    velocity.y = random(0.1f, 2);

    c = color(random(10, 245),
              random(10, 245),
              random(10, 245));
  }

  public SpaceBall(float x, float y, int c){
    position = new PVector(x, y);

    velocity = new PVector();
    velocity.x = random(0.1f, 2);
    velocity.y = random(0.1f, 2);

    this.c = c;
  }

  public void draw(){
    update();

    fill(c);
    noStroke();
    ellipse(position.x, position.y, diam, diam);
  }

  public void update(){
    bounderis();

    distanceBetween();

    position.x -= (distanceBetweenX * tpf);
    position.y -= (distanceBetweenY * tpf);
  }

  public void bounderis(){
    if(position.x < 0){
      //position.x *= -1;
      timeToTurn = false;
    }
    if(position.y < 0){
      //position.y *= -1;
      timeToTurn = false;
    }
    if(position.x > width){
      //position.x *= -1;
      timeToTurn = false;
    }
    if(position.y > height){
      //position.y *= -1;
      timeToTurn = false;
    }
  }

  public void distanceBetween(){
    timeToTurn();

    if(timeToTurn){
      distanceBetweenX = (position.x - planet.position.x) * -1;
      distanceBetweenY = (position.y - planet.position.y) * -1;
    } else {
      distanceBetweenX = (position.x - planet.position.x);
      distanceBetweenY = (position.y - planet.position.y);
    }
  }

  public void timeToTurn(){
    if((distanceBetweenX < 5 && distanceBetweenX > -5)
        && (distanceBetweenY < 5 && distanceBetweenY > -5)){
      timeToTurn = true;
    }
  }
}
  public void settings() {  size(1000, 1000); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "gravity" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
