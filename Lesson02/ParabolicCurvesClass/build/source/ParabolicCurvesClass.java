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

  LineCord axisY = new LineCord();
  LineCord axisX = new LineCord();
  int numberOfLines;

  public ParabolicCurve(LineCord axisX, LineCord axisY, int setNumberOfLines){

    this.axisX = axisX;
    this.axisY = axisY;
    numberOfLines = setNumberOfLines;
  }

  public void drawParabolicCurve(){
        float xDistanceForX = (axisX.x2 - axisX.x1)/numberOfLines;
        float yDistanceForX = (axisX.y2 - axisX.y1)/numberOfLines;

        float xDistanceForY = (axisY.x2 - axisY.x1)/numberOfLines;
        float yDistanceForY = (axisY.y2 - axisY.y1)/numberOfLines;


        for(int i = 0; i < numberOfLines; i++){

          strokeWeight(1);

          if(i % 3 == 0){
            stroke(0);
          } else {
            stroke(128);
          }

          float lineX1 = axisX.x1 + (i * xDistanceForX);
          float lineY1 = axisX.y1 + (i * yDistanceForX);

          float lineX2 = axisY.x1 + (i * xDistanceForY);
          float lineY2 = axisY.y1 + (i * yDistanceForY);

          line(lineX1, lineY1, lineX2, lineY2);

          stroke(0);
          strokeWeight(3);
          line(axisX.x1, axisX.y1, axisX.x2, axisX.y2);
          line(axisY.x1, axisY.y1, axisY.x2, axisY.y2);
      }
  }
}

public class LineCord{
  float x1;
  float y1;
  float x2;
  float y2;

  public LineCord(float x1, float y1, float x2, float y2){
    this.x1 = x1;
    this.y1 = y1;
    this.x2 = x2;
    this.y2 = y2;
  }

  public LineCord(){
    this.x1 = 0;
    this.y1 = 0;
    this.x2 = 0;
    this.y2 = 0;
  }
}

public void setup(){
  
}

public void draw(){

  background(255);
  LineCord yAxis = new LineCord(63, 66, 474 ,708);
  LineCord xAxis = new LineCord(yAxis.x2, yAxis.y2, 920, 63);
  int numberOfLines = 60;
  ParabolicCurve kurva = new ParabolicCurve(xAxis, yAxis, numberOfLines);
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
