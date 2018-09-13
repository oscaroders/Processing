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

public class trigincolor extends PApplet {

float frame = 0;
float multiplier = 0.04f;
int numberOfPoints = 60;
int widthisch = 640;
int circleRad = 200;
int circleDiam = circleRad * 2;
int pointDistance = (widthisch/numberOfPoints) + 1;

public void setup()
{
	
	strokeWeight(5);
}

public void draw()
{
	background(255);
  int[] center = {320, 240};
  int lineDegreeLengt = 90;

    for(float angle = 0; radians(angle) < 2*PI; angle += 360/numberOfPoints){



      strokeWeight(1);
      point(center[0] + cos(radians(angle + frame)) * circleRad, center[1] + (sin(radians(angle + frame)) * circleRad));
      point(center[0] + cos(radians(angle + lineDegreeLengt + frame)) * circleRad, center[1] + (sin(radians(angle + lineDegreeLengt + frame)) * circleRad));
      LineCord connectLine = new LineCord(center[0] + cos(radians(angle + frame)) * circleRad,
                                          center[1] + (sin(radians(angle + frame)) * circleRad),
                                          center[0] + cos(radians(angle + lineDegreeLengt + frame)) * circleRad,
                                          center[1] + (sin(radians(angle + lineDegreeLengt + frame)) * circleRad));

      line(connectLine.x1, connectLine.y1, connectLine.x2, connectLine.y2);
      strokeWeight(3);
      stroke(0);
      noFill();
      ellipse(center[0], center[1], circleDiam, circleDiam);
      frame += 0.02f;
		}
}


/*

LineCord axis1 = new LineCord(center[0] + (cos(radians(angle)) * cirkleRad),
                              center[1] + (sin(radians(angle)) * cirkleRad),
                              center[0] + (cos(radians(angle * 2)) * cirkleRad),
                              center[1] + (sin(radians(angle * 2)) * cirkleRad));

LineCord axis2 = new LineCord(center[0] + (cos(radians(angle * 2)) * cirkleRad),
                              center[1] + (sin(radians(angle * 2)) * cirkleRad),
                              center[0] + (cos(radians(angle * 4)) * cirkleRad),
                              center[1] + (sin(radians(angle * 4)) * cirkleRad));

int numberOfLines = 60;
ParabolicCurve kurva = new ParabolicCurve(axis1, axis2, numberOfLines);
kurva.drawParabolicCurve();

*/
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
        /*loat xDistanceForX = (axisX.x2 - axisX.x1)/numberOfLines;
        float yDistanceForX = (axisX.y2 - axisX.y1)/numberOfLines;

        float xDistanceForY = (axisY.x2 - axisY.x1)/numberOfLines;
        float yDistanceForY = (axisY.y2 - axisY.y1)/numberOfLines;*/


        for(int i = 0; i < numberOfLines; i++){

          strokeWeight(1);

          if(i % 3 == 0){
            stroke(0);
          } else {
            stroke(0, 255, 0);
          }

          float lineX1 = distance(axisX, 'x', i);//axisX.x1 + (i * xDistanceForX);
          float lineY1 = distance(axisX, 'y', i);//axisX.y1 + (i * yDistanceForX);

          float lineX2 = distance(axisY, 'x', i);//axisY.x1 + (i * xDistanceForY);
          float lineY2 = distance(axisY, 'y', i);//axisY.y1 + (i * yDistanceForY);

          line(lineX1, lineY1, lineX2, lineY2);

          /*stroke(0);
          strokeWeight(3);
          line(axisX.x1, axisX.y1, axisX.x2, axisX.y2);
          line(axisY.x1, axisY.y1, axisY.x2, axisY.y2);*/
      }
  }

  public float distance(LineCord axis, char xory, int i){
    if(xory == 'x'){
      float xDistance = axis.x1 + (i * (axis.x2 - axis.x1) / numberOfLines);
      return xDistance;
    } else {
      float yDistance = axis.y1 + (i * (axis.y2 - axis.y1) / numberOfLines);
      return yDistance;
    }

    // Make exeptionhandler here...

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
  public void settings() { 	size(640, 480); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "trigincolor" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
