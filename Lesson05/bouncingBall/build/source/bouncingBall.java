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

public class bouncingBall extends PApplet {

float posY = 100;
float posX = 500;
PVector vec1 = new PVector(posX, posY);
float velocityY = 160;
float velocityX = 50;
PVector velocity = new PVector(velocityX, velocityY);
float acceleration = 50;
float tpf;
float time;

public void setup(){
  
  frameRate(60);
}

public void draw(){
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

public void drawSite(){
  background(255);
  ellipse(vec1.x, vec1.y, 10, 10);
}
  public void settings() {  size(1000, 500); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "bouncingBall" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
