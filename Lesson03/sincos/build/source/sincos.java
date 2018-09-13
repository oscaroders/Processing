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

public class sincos extends PApplet {

int frame = 0;
float multiplier = 0.04f;
int numberOfPoints = 100;
int widthisch = 640;
int pointDistance = (widthisch/numberOfPoints) + 1;

public void setup()
{
	
	strokeWeight(5);
}

public void draw()
{
	background(255);

	//Draw animated point
    for(int i = 0; i < numberOfPoints; i++){
         stroke(i*2, 0, 0);
         point(i * pointDistance, height/2 + sin((i + frame) * multiplier) * 200);
         stroke(0, i*2, 0);
         point(i * pointDistance, height/2 + cos((i + frame) * multiplier) * 200);
    }

    frame++;

}
  public void settings() { 	size(640, 480); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "sincos" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
