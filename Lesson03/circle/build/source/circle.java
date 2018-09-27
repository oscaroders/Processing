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

float frame = 0;
int numberOfPoints = 20;
int cirkleRad = 50;
float coils = 4;
float maxAngle = coils * PI * 2;
float steps = cirkleRad / maxAngle;
float distanceBetweenPoint = 1;


float rotation = 1;


public void setup()
{
	
	strokeWeight(5);
}

public void draw()
{
	background(255);
  int[] center1 = {width / 4, 240};
	int[] center2 = {3 * width / 4, 240};

    for(float angle = 0; radians(angle) < 2*PI; angle += 360/numberOfPoints){
      point(center1[0] + cos(radians(angle + frame)) * cirkleRad, center1[1] + (sin(radians(angle + frame)) * cirkleRad));
			frame++;
		}

		for(float angle = 0; radians(angle) < maxAngle; angle ++){
			float away = angle * 0.1f;
			point(center2[0] + cos(radians(angle)) * away,
						center2[1] + (sin(radians(angle)) * away));

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
