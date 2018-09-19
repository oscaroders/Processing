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
float velocity = 160;
float acceleration = 2;
float tpf;
float time;

public void setup(){
  
  frameRate(60);
}

public void draw(){
  int currentTime = millis();

  tpf = (currentTime - time) * 0.001f;

  drawSite();

  velocity += acceleration;
  posY += velocity * tpf;
  posX++;

  if(posY > height){
    velocity *= -1;
    posY = height - 1;
  }

  if(posX > width){
    posX = 0;
  }

  time = currentTime;
}

public void drawSite(){
  background(255);
  ellipse(posX, posY, 10, 10);
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
