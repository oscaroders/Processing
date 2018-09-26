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

public class SpaceDot extends PApplet {

boolean firstItt;
PVector[] starPos;
int numberOfStars;
int backgcount;

public void setup(){
  
  firstItt = true;
  backgcount = 0;
  numberOfStars = 50;
  starPos = new PVector[numberOfStars];
}

public void draw(){
  drawBackground();

  if(firstItt){
    firstItt = false;
  }
}
class Dot{
  PVector position;
  int score;
  String name;
  float size;

  public Dot(String name){
    this.name = name;
    position = new PVector(width / 2, height / 2);
    size = 30;
    score = 0;
  }

  public void update(){

  }

  public void draw(){
    fill(spaceDotPurple);
    ellipse(position.x ,position.y, size, size);
  }
}
class Missile{

  public Missile(){
    
  }
}
class ObjectManager{

  public ObjectManager(){
    
  }
}
class SpaceFruit{

  public SpaceFruit(){
    
  }
}
int yellow = color(255, 255, 102);
int lightYellow = color(255, 255, 204);
int spaceBlue = color(12, 36, 39);
int spaceDotPurple = color(102, 0, 102);
public void drawBackground(){
  background(spaceBlue);

  if(firstItt){
    generateBackground();
  }

  for(int i = 0; i < numberOfStars; i++){
    if(backgcount % (int)random(7, 23) == 0){
      stroke(lightYellow);
      strokeWeight(random(2, 5));
    } else {
      stroke(yellow);
      strokeWeight(2);
    }
    point(starPos[i].x, starPos[i].y);
    backgcount++;
  }
}

public void generateBackground(){
  for(int i = 0; i < numberOfStars; i++){
    starPos[i] = new PVector(random(0, width),
                             random(0, height));
  }
}
  public void settings() {  size(1000, 500); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "SpaceDot" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
