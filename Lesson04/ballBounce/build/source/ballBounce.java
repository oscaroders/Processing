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

public class ballBounce extends PApplet {

PVector ballVec = new PVector(500, 250);
PVector ballPosVec = new PVector(500, 250);
float diam = 10;
float rad = diam/2;
float speedX = random(-5, 5);
float speedY = random(-5, 5);


public void setup(){
  
}

public void draw(){
  background(255);

  fill(0);
  ellipse(ballPosVec.x + ballVec.x, ballPosVec.y + ballVec.y, diam, diam);

  move();
  bounce();
}

public void move(){
  ballVec.set(speedX , speedY);
  ballPosVec.add(ballVec);
}

public void bounce(){
  if(ballPosVec.y > height - rad)
    speedY *= -1;

  if(ballPosVec.y < 0 + rad)
      speedY *= -1;

  if(ballPosVec.x > width - rad)
      speedX *= -1;

  if(ballPosVec.x < 0 + rad)
      speedX *= -1;
}
  public void settings() {  size(1000, 500); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "ballBounce" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
