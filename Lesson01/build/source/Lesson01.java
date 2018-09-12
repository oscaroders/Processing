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

public class Lesson01 extends PApplet {

public void setup()
{
  //Window size
  
}

//pacMan - sets the vales for drawing the PACMAN
private void pacMan(int x)
{
  name();

   //dots to eat
   if(!doesPacMove)
   {
       eatableStuff(counter);
   } else {
       eatingStuff(counter);
   }

   //E - PACMAN
   stroke(255, 255, 0);
   strokeWeight(1.5f);
   fill(255, 255, 0);
   // -2 on stapsToMove to weigh up stepsToMove starting value
   arc(410 + (int)stepsToMove-2, 196, 120, 120, (37-x)*(PI/180), (323+x)*(PI/180), PIE);

   //EYE
   stroke(0);
   strokeWeight(1.5f);
   fill(0);
   // -2 on stapsToMove to weigh up stepsToMove starting value
   ellipse((411+(x/2)) + (int)stepsToMove-2, 162+(x/3.5f), 11, 11);


}//pacMan

boolean isPacOpen = true;
boolean isTimeToMove = false;
boolean doesPacMove = false;
boolean didPacEat = false;
boolean waitPacClose = false;
int x = 0;
double stepsToMove = 2;
char counter = 0; //usening char to make counter non-negative (don´t remember if there is another asy way of doing this)
int frame = 0;


// pacManAnimation - sets an x value deciding how to animate the PACMAN
// there is a lot of magic numbers here - aka somthing to fix later
private void pacManAnimation()
{
   if(isPacOpen)
   {
      pacMan(x);
      x++;
   } else {
      pacMan(x);
      x--;
   }

   if(x == 0)
   {
      isPacOpen = true;
   } else if (x == 37){
      isPacOpen = false;
      //Counter to display dots
      if(counter < 6 && !isTimeToMove)
      {
          counter++;
      }
      //To evaluate when to move PACMAN
      if(counter == 6)
      {
          isTimeToMove = true;
      }
   }

   if(isTimeToMove)
   {
       stepsToMove = stepsToMove + 0.5f; //last value has to be 0.5 to work. why? - I don´t know...

       if(stepsToMove % 45 == 1)
       {
           waitPacClose = true;
       }
       if(waitPacClose && x == 37)
       {
           counter--;
           waitPacClose = false;
       }
       doesPacMove = true;
       if(stepsToMove > 500){isTimeToMove = false;}
   }

   scanLines();

}//pacManAnimation

private void eatableStuff(int numberOfDots)
{
  stroke(160, 242, 253);
  strokeWeight(0.2f);
  fill(160, 242, 253);

  switch (numberOfDots){
    case 1:   ellipse(499, 197, 16, 16);
              break;
    case 2:   ellipse(499, 197, 16, 16); ellipse(549, 197, 16, 16);
              break;
    case 3:   ellipse(499, 197, 16, 16); ellipse(549, 197, 16, 16); ellipse(599, 197, 16, 16);
              break;
    case 4:   ellipse(499, 197, 16, 16); ellipse(549, 197, 16, 16); ellipse(599, 197, 16, 16); ellipse(649, 197, 16, 16);
              break;
    case 5:   ellipse(499, 197, 16, 16); ellipse(549, 197, 16, 16); ellipse(599, 197, 16, 16); ellipse(649, 197, 16, 16); ellipse(699, 197, 16, 16);
              break;
    case 6:   ellipse(499, 197, 16, 16); ellipse(549, 197, 16, 16); ellipse(599, 197, 16, 16); ellipse(649, 197, 16, 16); ellipse(699, 197, 16, 16); ellipse(749, 197, 16, 16);
              break;
  }
}

private void eatingStuff(int numberOfDots)
{
  stroke(160, 242, 253);
  strokeWeight(0.2f);
  fill(160, 242, 253);

  switch (numberOfDots){
    case 1:   ellipse(749, 197, 16, 16);
              break;
    case 2:   ellipse(699, 197, 16, 16); ellipse(749, 197, 16, 16);
              break;
    case 3:   ellipse(649, 197, 16, 16); ellipse(699, 197, 16, 16); ellipse(749, 197, 16, 16);
              break;
    case 4:   ellipse(599, 197, 16, 16); ellipse(649, 197, 16, 16); ellipse(699, 197, 16, 16); ellipse(749, 197, 16, 16);
              break;
    case 5:   ellipse(549, 197, 16, 16); ellipse(599, 197, 16, 16); ellipse(649, 197, 16, 16); ellipse(699, 197, 16, 16); ellipse(749, 197, 16, 16);
              break;
    case 6:   ellipse(499, 197, 16, 16); ellipse(549, 197, 16, 16); ellipse(599, 197, 16, 16); ellipse(649, 197, 16, 16); ellipse(699, 197, 16, 16); ellipse(749, 197, 16, 16);
              break;
  }
}

//name - Sets values för drawing the letters for the name and background triangles
private void name()
{
   background(0);

   //Background triangels
   stroke(0);
   strokeWeight(0);
   fill(60,60+x*5,2);
   triangle(613, 90, 383, 346, 153, 90);
   fill(255-x*3,94+x,134+x*2);
   triangle(593, 75, 383, 326, 173, 75);

   //O
   stroke(255, 255, 255);
   strokeWeight(1.5f);
   fill(255, 255, 255);
   ellipse(152, 196, 120, 120);
   strokeWeight(40.3f);
   line(322, 88, 322, 234);

   //D
   strokeWeight(1.5f);
   ellipse(277, 196, 120, 120);

   //S
   arc(626, 196, 120, 120, 165*(PI/167), 347*(PI/181), CHORD);
   arc(609, 194, 120, 120, 334*(PI/167), 526*(PI/181), CHORD);

   //R
   strokeWeight(40.3f);
   line(497, 152, 497, 234);
   curve(822, 91, 540, 153, 498, 156, 498, -149);
}//name

public void scanLines(){
  //Draw our scan lines.
   for (int i = 0; i < height; i = i + 10) {
   stroke(12, 250, 112, 25);
   strokeWeight(5);
       //change height based on time (and use % to loop)
   line(0, (i + frame) % height, width, (i + frame) % height);
   }

   frame++;
}

public void draw()
{
    pacManAnimation();
}



// kolla om man kan få PAC att äta i loop... och lite fortare... med modulus.
  public void settings() {  size(768, 432); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "Lesson01" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
