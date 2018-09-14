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
int numberOfPoints = 84;
int widthisch = 640;
float sizeCount = 1;
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

  sizeCount += 0.02f;

  float circleRad = 150;
  float circleDiam = circleRad * 2;

	strokeWeight(20);
	stroke(random(0,255), random(0,255), random(0,255));
	point(25,25);
	stroke(random(0,255), random(0,255), random(0,255));
	point(25, height - 25);
	stroke(random(0,255), random(0,255), random(0,255));
	point(width - 25 ,25);
	stroke(random(0,255), random(0,255), random(0,255));
	point(width - 25, height - 25);

  for(float angle = 0; radians(angle) < 2*PI; angle += 360/numberOfPoints){
    strokeWeight(1);
    stroke(128 + sin(angle)*100, 128 + cos(frame) * 100, 128 + tan(circleRad));
    LineCord connectLine = new LineCord(center[0] + cos(radians(angle - frame)) * circleRad*1.5f,
                                        center[1] + (sin(radians(angle - frame)) * circleRad*1.5f),
                                        center[0] + cos(radians(angle + lineDegreeLengt - frame)) * circleRad*1.5f,
                                        center[1] + (sin(radians(angle + lineDegreeLengt - frame)) * circleRad*1.5f));

    line(connectLine.x1, connectLine.y1, connectLine.x2, connectLine.y2);
    strokeWeight(5);
    stroke(0);
    noFill();
    ellipse(center[0], center[1], circleDiam, circleDiam);
  }

  strokeWeight(3);
  stroke(255, 255, 0);
  fill(230, 0, 0);
  ellipse(center[0], center[1], circleDiam, circleDiam);

		for(float angle = 0; radians(angle) < PI/2; angle += 90/numberOfPoints){
      strokeWeight(1);
      LineCord connectLine = new LineCord(center[0] + cos(radians(angle + frame +90)) * circleRad,
                                          center[1] + (sin(radians(angle + frame +90)) * circleRad),
                                          center[0] + cos(radians(angle + lineDegreeLengt + frame +90)) * circleRad,
                                          center[1] + (sin(radians(angle + lineDegreeLengt + frame +90)) * circleRad));

      line(connectLine.x1, connectLine.y1, connectLine.x2, connectLine.y2);

		}

    for(float angle = 0; radians(angle) < PI/2; angle += 90/numberOfPoints){
      strokeWeight(1);
      LineCord connectLine = new LineCord(center[0] + cos(radians(angle + frame -90)) * circleRad,
                                          center[1] + (sin(radians(angle + frame -90)) * circleRad),
                                          center[0] + cos(radians(angle + lineDegreeLengt + frame -90)) * circleRad,
                                          center[1] + (sin(radians(angle + lineDegreeLengt + frame -90)) * circleRad));

      line(connectLine.x1, connectLine.y1, connectLine.x2, connectLine.y2);
    }

    for(float angle = 0; radians(angle) < PI/2; angle += 90/numberOfPoints){
      strokeWeight(1);
      LineCord connectLine = new LineCord(center[0] + cos(radians(angle + frame -180)) * circleRad,
                                          center[1] + (sin(radians(angle + frame -180)) * circleRad),
                                          center[0] + cos(radians(angle *2 + lineDegreeLengt + frame -180)) * circleRad,
                                          center[1] + (sin(radians(angle *2 + lineDegreeLengt + frame -180)) * circleRad));

      line(connectLine.x1, connectLine.y1, connectLine.x2, connectLine.y2);
    }

    for(float angle = 0; radians(angle) < PI/2; angle += 90/numberOfPoints){
      strokeWeight(1);
      LineCord connectLine = new LineCord((center[0] + -1*cos(radians(angle - frame +180)) * circleRad),
                                          (center[1] + (sin(radians(angle - frame +180)) * circleRad)),
                                          (center[0] + -1*cos(radians(angle *2 + lineDegreeLengt - frame +180)) * circleRad) ,
                                          (center[1] + (sin(radians(angle *2 + lineDegreeLengt - frame +180)) * circleRad)));

      line(connectLine.x1, connectLine.y1, connectLine.x2, connectLine.y2);

    }
    frame += 0.1f;
}
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
