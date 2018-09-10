import processing.serial.*;

void setup()
{
   size(768, 432); 
}

 private void pacManAnimation()
{
    //PACMAN - OPEN
    name();
    
    delay(600);
    println("a ");
    
    //PACMAN - CLOSED
    
    stroke(255, 255, 0);
    strokeWeight(1.5);
    fill(255, 255, 0);
    println("before arc");
    arc(413, 196, 120, 120, 0*(PI/180), (360)*(PI/180), PIE);
    println("after arc");
    
    //EYE
    stroke(0);
    strokeWeight(1.5);
    fill(0);
    ellipse(411, 162, 11, 11);
    
    delay(600);
 
    println("b ");
}

private void name()
{
   background(0);
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
   arc(612, 196, 120, 120, 165*(PI/167), 347*(PI/181), CHORD);
   arc(599, 194, 120, 120, 334*(PI/167), 526*(PI/181), CHORD);
   
   //R
   strokeWeight(40.3);
   line(497, 152, 497, 234);
   line(528, 153, 501, 177);
    
   //E
   stroke(255, 255, 0);
   strokeWeight(1.5);
   fill(255, 255, 0);
   arc(413, 196, 120, 120, 37*(PI/180), 313*(PI/180), PIE);
     
   //EYE
   stroke(0);
   strokeWeight(1.5);
   fill(0);
   ellipse(411, 162, 11, 11);

}
 

void draw()
{
    pacManAnimation(); 
     println("finito");
}
