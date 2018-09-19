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
float velocity = 160;
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

  velocity += acceleration;
  vec1.y += velocity * tpf;
  vec1.x = vec1.x + 50 * tpf;

  if(vec1.y > height){
    velocity *= -1;
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
public class OVector{

  float xValue;
  float yValue;

  public OVector(float xValue, float yValue){
    this.xValue = xValue;
    this.yValue = yValue;
  }

  public OVector(){
    this.xValue = xValue;
    this.yValue = yValue;
  }

  public void setAngle(float angle){
    float length = this.getLength();
    xValue = cos(angle) * length;
    yValue = sin(angle) * length;
  }

  public float getAngle(){
    return degrees(atan(yValue / xValue));
  }

  public void setlength(float length){
    float angle = this.getAngle();
    xValue = cos(angle) * length;
    yValue = sin(angle) * length;
  }

  public float getLength(){
    return sqrt(sq(xValue) + sq(yValue));
  }

  public OVector add(OVector v1){
    OVector vec = new OVector(xValue + v1.xValue, yValue + v1.yValue);
    return vec;
  }

  public OVector sub(OVector v1){
    OVector vec = new OVector(xValue - v1.xValue, yValue - v1.yValue);
    return vec;
  }

  public OVector multi(float multiplier){
    OVector vec = new OVector(xValue * multiplier, yValue * multiplier);
    return vec;
  }

  public OVector unit(){
    OVector vec = new OVector(xValue / abs(xValue), yValue / abs(yValue));
    return vec;
  }

  public float scalar(OVector vec){
    float length1 = this.getLength();
    float length2 = vec.getLength();
    float angle1 = this.getAngle();
    float angle2 = vec.getAngle();
    float angle = abs(angle1 - angle2);
    float scal = (length1 * length2 * angle);
    return scal;
  }

  public boolean isOrto(OVector vec){
    float a = this.scalar(vec);
    if(a == 0){
      return true;
    } else {
      return false;
    }
  }

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
