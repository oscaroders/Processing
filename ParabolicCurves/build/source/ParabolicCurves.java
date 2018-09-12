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

int lineDistance = 20;

public void setup(){
  
  strokeWeight(1);
}

public void draw(){
  parabolicCurve();
}

public void parabolicCurve(){

  for(int i = 0; i < height; i += lineDistance){
    line(0, i, i, height);

    if(i % 3 == 0){
      stroke(0);
    } else {
      stroke(75, 75, 75);
    }
  }
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
