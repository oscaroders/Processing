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

public class ParabolicCurvesClass extends PApplet {

public class ParabolicCurve {

  float[] axisX = new float[4];
  float[] axisY = new float[4];
  int numberOfLines;

  public ParabolicCurve(float[] setAxisX, float[] setAxisY, int setNumberOfLines){
    this.axisX = setAxisX;
    this.axisY = setAxisY;
    numberOfLines = setNumberOfLines;
  }

  public void drawParabolicCurve(){
      println(axisX);
  }
}

//array = {x1, y1, x2, y2}
float[] yAxis = {10, 10, 10 ,500};
float[] xAxis = {yAxis[2], yAxis[3], 3, 4};

public void setup(){
  
  noLoop();
}



public void draw(){

  ParabolicCurve kurva = new ParabolicCurve(xAxis, yAxis, 10);
  kurva.drawParabolicCurve();

}
  public void settings() {  size(1000, 1000); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "ParabolicCurvesClass" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
