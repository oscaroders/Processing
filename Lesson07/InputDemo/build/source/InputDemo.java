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

public class InputDemo extends PApplet {

PVector position;
float speed = 5;

public void setup(){
  
  position = new PVector(width / 2, height / 2);
  ellipseMode(CENTER);
}

public void draw(){
  background(255);
  float xMovment = getAxisRaw("Horizontal") * speed;
  position.x += xMovment;
  ellipse(position.x, position.y, 50, 50);
}
boolean moveLeft;
boolean moveRight;

public void keyPressed(){
  if(key == CODED){
    if(keyCode == RIGHT){
      moveRight = true;
    }
    if(keyCode == LEFT){
      moveLeft = true;
    }
  }
  if(key == 'd' || key == 'D'){
    moveRight = true;
  }
  if(key == 'a' || key == 'A'){
    moveLeft = true;
  }
}

public void keyReleased(){
  if(key == CODED){
    if(keyCode == RIGHT){
      moveRight = false;
    }
    if(keyCode == LEFT){
      moveLeft = false;
    }
  }
  if(key == 'd' || key == 'D'){
    moveRight = false;
  }
  if(key == 'a' || key == 'A'){
    moveLeft = false;
  }
}

public float getAxisRaw(String axis){
  if(axis == "Horizontal"){
    if(moveLeft){
      return -1;
    }
    if(moveRight){
      return 1;
    }
  }

  return 0;
}
  public void settings() {  size(1024, 1024); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "InputDemo" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
