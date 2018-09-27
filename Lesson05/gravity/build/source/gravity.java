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
  background(0);

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
  PVector distanceBetween;
  int c;
  float diam = 10;
  float distanceBetweenX, distanceBetweenY;
  boolean timeToTurn;
  float acc = 5;

  public SpaceBall(){
    position = new PVector();
    position.x = random(0, width);
    position.y = random(0, height);

    velocity = new PVector();
    velocity.x = random(1, 2);
    velocity.y = random(1, 2);

    distanceBetween = new PVector();

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

    distanceBetween = new PVector();

    this.c = c;
  }

  public SpaceBall(float x, float y){
    position = new PVector(x, y);

    velocity = new PVector();
    velocity.x = random(0.1f, 2);
    velocity.y = random(0.1f, 2);

    distanceBetween = new PVector();

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

    distanceBetween();

  //  distanceBetween.mult(distanceBetween.mag() * tpf);
    velocity.add(distanceBetween);
    position.add(velocity);
  }

  public void distanceBetween(){

    distanceBetween.set((position.x - planet.position.x) * -1, (position.y - planet.position.y) * -1);

    distanceBetween.normalize();

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
