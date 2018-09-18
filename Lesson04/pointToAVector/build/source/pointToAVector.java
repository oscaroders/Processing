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

public class pointToAVector extends PApplet {

PVector vec1 = new PVector();
int windowWidth = 1000;
int windowHeight = 500;
int vecX = (int)random(0, windowWidth);
int vecY = (int)random(0, windowHeight);
int score;
boolean hasClicked = false;
int x;
int y;

public void setup(){
  
}

public void draw(){
  background(255);
  vec1.set(vecX, vecY);
  message();
  drawPoint();
}

public void message(){
  String mess = "Click on (" + vec1.x +", " + vec1.y +")";
  String feedBack = "You were " + abs(vec1.x - x) + " in x, and " + abs(vec1.y - y) + " in y from the point.";
  String feedBack2 = "I, the computer, feel like giving you " + score + " as a score!";

  if(hasClicked){
    fill(0);
    textSize(25);
    textAlign(CENTER, BOTTOM);
    text(feedBack,  width/2, 40);
    textAlign(CENTER, TOP);
    text(feedBack2, width/2, 40);
  } else {
    fill(0);
    textSize(20);
    textAlign(CENTER, BOTTOM);
    text(mess, width/2, 40);
  }
}

public void drawPoint(){
  mousePressed();
  stroke(0);
  strokeWeight(5);
  point(x, y);
}

public void mousePressed(){
  if(mousePressed){
    x = mouseX;
    y = mouseY;
    score = (int)random(1, 100);
    hasClicked = true;
  }
}
  public void settings() {  size(1000, 500); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "pointToAVector" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
