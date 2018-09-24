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

public class mouseHunter extends PApplet {

float diam = 50;
PVector circleVec = new PVector(500, 250);
PVector vec1 = new PVector(circleVec.x, circleVec.y);

public void setup(){
  
}

public void draw(){
  background(255);

  stroke(0);
  ellipse(circleVec.x, circleVec.y, diam, diam);
  line(circleVec.x, circleVec.y, circleVec.x + vec1.x * diam/2, circleVec.y + vec1.y * diam/2);
  move();

}

public void move(){
    vec1.set(mouseX - circleVec.x, mouseY - circleVec.y);
    vec1.normalize();
    circleVec.add(vec1);
}
  public void settings() {  size(1000,500); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "mouseHunter" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
