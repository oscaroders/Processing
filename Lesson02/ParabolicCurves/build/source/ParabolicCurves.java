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

public class ParabolicCurves extends PApplet {

int lineDistance = 50;
int frame = 0;

public void setup(){
  
  strokeWeight(1);
  background(255);
  stroke(0);
}

public void draw(){

  parabolicCurve();

}


public void parabolicCurve(){

  for(int i = 0; i < height; i += lineDistance){

    line(0, (i + frame) % height, (i + frame) % height, height);
    line((i + frame) % height, height, width, height-(i + frame) % height);
    //line(i, 0, width, i);
    line(width-(i + frame) % height, 0, 0, (i + frame) % height);


    if(i % 3 == 0){
      stroke(225, 225, 0);
    } else {
      stroke(75, 75, 75);
    }
  }

  frame += 5;
}
  public void settings() {  size(1000,1000); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "ParabolicCurves" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
