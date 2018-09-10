import processing.serial.*;

void setup()
{
  //Window size 
  size(768, 432); 
}

//pacMan - sets the vales for drawing the PACMAN
private void pacMan(int x)
{
  name();
  //E - PACMAN
   stroke(255, 255, 0);
   strokeWeight(1.5);
   fill(255, 255, 0); 
   arc(410, 196, 120, 120, (37-x)*(PI/180), (323+x)*(PI/180), PIE);
     
   //EYE
   stroke(0);
   strokeWeight(1.5);
   fill(0);
   ellipse(411+(x/2), 162+(x/3.5), 11, 11);
}//pacMan

boolean isPacOpen = true;
int x = 0;

// pacManAnimation - sets an x value deciding how to animate the PACMAN
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
   }
}//pacManAnimation

//name - Sets values för drawing the letters for the name
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
   strokeWeight(1.5);
   fill(255, 255, 255);
   ellipse(152, 196, 120, 120);
   strokeWeight(40.3);
   line(322, 88, 322, 234);
   
   //D
   strokeWeight(1.5);
   ellipse(277, 196, 120, 120);
   
   //S
   arc(626, 196, 120, 120, 165*(PI/167), 347*(PI/181), CHORD);
   arc(609, 194, 120, 120, 334*(PI/167), 526*(PI/181), CHORD);
   
   //R
   strokeWeight(40.3);
   line(497, 152, 497, 234);
   curve(822, 91, 540, 153, 498, 156, 498, -149);
}//name
 

void draw()
{  
    pacManAnimation();  
}//draw
