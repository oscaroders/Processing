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

public class circle extends PApplet {

int frame = 0;
float multiplier = 0.04f;
int numberOfPoints = 20;
int widthisch = 640;
int cirkleRad = 50;
int pointDistance = (widthisch/numberOfPoints) + 1;

public void setup()
{
	
	strokeWeight(5);
}

public void draw()
{
	background(255);
  int[] center = {320, 240};

    for(float angle = 0; radians(angle) < 2*PI; angle += 360/numberOfPoints){
      point(center[0] + cos(radians(angle)) * cirkleRad, center[1] + sin(radians(angle)) * cirkleRad);
    }
}
  public void settings() { 	size(640, 480); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "circle" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
