void setup()
{
  //Window size 
  size(768, 432); 
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
   strokeWeight(1.5);
   fill(255, 255, 0); 
   // -2 on stapsToMove to weigh up stepsToMove starting value
   arc(410 + (int)stepsToMove-2, 196, 120, 120, (37-x)*(PI/180), (323+x)*(PI/180), PIE);
     
   //EYE
   stroke(0);
   strokeWeight(1.5);
   fill(0);
   // -2 on stapsToMove to weigh up stepsToMove starting value
   ellipse((411+(x/2)) + (int)stepsToMove-2, 162+(x/3.5), 11, 11);

   
}//pacMan

boolean isPacOpen = true;
boolean isTimeToMove = false;
boolean doesPacMove = false;
boolean didPacEat = false;
boolean waitPacClose = false;
int x = 0;
double stepsToMove = 2;
char counter = 0; //usening char to make counter non-negative (don´t remember if there is another asy way of doing this)


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
       stepsToMove = stepsToMove + 0.5; //last value has to be 0.5 to work. why? - I don´t know...
       
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
}//pacManAnimation

private void eatableStuff(int numberOfDots)
{
  stroke(160, 242, 253);
  strokeWeight(0.2);
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
  strokeWeight(0.2);
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
}
