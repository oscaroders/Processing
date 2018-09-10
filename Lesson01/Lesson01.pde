import processing.serial.*;

void setup()
{
   size(768, 432); 
}

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
   ellipse(411, 162, 11, 11);
}

boolean isPacOpen = true;
int x = 0;

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
}

private void name()
{
   background(0);
   stroke(0);
   strokeWeight(1.5);
   fill(255-x*3,94+x,134+x*2);
   triangle(593, 75, 383, 326, 173, 75);
   
   stroke(255, 255, 255);
   strokeWeight(1.5);
   fill(255, 255, 255);
   
   //O
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
   //line(528, 153, 501, 177);
   curve(822, 91, 540, 153, 498, 156, 498, -149);

}
 

void draw()
{  
    pacManAnimation();  
}
