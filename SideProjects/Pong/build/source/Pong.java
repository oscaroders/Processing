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

public class Pong extends PApplet {

boolean gameStart = false;
int windowWidth = 1000;
int windowHeight = 500;
int[] ballColor = {128, 128, 128};
int[] playersColor = {255, 0, 0};
int scoreAlpha = 100;
int[] oppositeColor  = {0, 255, 0};
int[] middleLineColor = {240, 240, 240};
int diam = 20;
int x = (int)random(50, 400);
int y = (int)random(50, 450);
int paddleWidth = 10;
int paddleHeight = 100;
int paddleSpeed = 10;
int playersPaddlePositionX = 1000-paddleWidth;
int oppositePaddlePositionX = 0;
int playersPaddlePositionY = 0;
int oppositePaddlePositionY = 0;
int middleLineWidth = 10;
int middleLinePosition = 500-middleLineWidth/2;
int speedX = (int)random(7, 9);
int speedY = (int)random(7, 9);
int reverse = -1;
int playersPoint = 0;
int oppositePoint = 0;
String oppositeScore;


public void setup()
{
  
}

public void draw()
{
    background(255);

    //middleLine
    noStroke();
    fill(middleLineColor[0], middleLineColor[1], middleLineColor[2]);
    rect(middleLinePosition, 0, middleLineWidth, 500);

    //drawes the ball
    noStroke();
    fill(ballColor[0], ballColor[1], ballColor[2]);
    ellipse(x, y, diam, diam);

    //players paddle
    playersPaddlePositionY = mouseY;
    noStroke();
    fill(playersColor[0], playersColor[1], playersColor[2]);
    rect(playersPaddlePositionX, playersPaddlePositionY, paddleWidth, paddleHeight);

    //opposite paddle
    oppositePaddlePositionY = y - paddleHeight/2;
    noStroke();
    fill(oppositeColor[0], oppositeColor[1], oppositeColor[2]);
    rect(oppositePaddlePositionX, oppositePaddlePositionY, paddleWidth, paddleHeight);

    pointCounter(oppositePoint);

    if(gameStart)
    {
        x = x + speedX;
        y = y + speedY;
    }

    if(y+diam/2 > windowHeight || y-diam/2 < 0)
    {
        speedY = speedY*reverse;
        y = y + speedY;
    }

    if((x+diam/2 > windowWidth - paddleWidth) && ((y > playersPaddlePositionY && y < playersPaddlePositionY + paddleHeight)))
    {
        speedX = speedX*reverse;
        x = x + speedX;
        y = (y + (int)random(2, 5)) + speedY;
    }

    if((x-diam/2 < 0 + paddleWidth) && (y > oppositePaddlePositionY && y < oppositePaddlePositionY + paddleHeight))
    {
        speedX = speedX*reverse;
        x = x + speedX;
        y = (y + (int)random(2, 5)) + speedY;
    }

    if(x > windowWidth)
    {
        gameStart = false;
        x = (int)random(50, 400);
        y = (int)random(50, 450);
        speedX = (int)random(7, 9);
        speedY = (int)random(7, 9);
        oppositePoint++;
    }

}

public void mousePressed()
{
    gameStart = !gameStart;
}

public void pointCounter(int points)
{
    points = points+1;
    String score = "zero";
    switch (points){
        case 1:  score = "zero";
        break;
        case 2:  score = "one";
        break;
        case 3:  score = "two";
        break;
        case 4:  score = "three";
        break;
        case 5:  score = "four";
        break;
        case 6:  score = "five";
        break;
        case 7:  score = "WINS!";
        break;
    }

    int textHeight = 62;
    textSize(textHeight);
    int d = color(oppositeColor[0], oppositeColor[1], oppositeColor[2], scoreAlpha);
    fill(d);
    text(score, (width/4) - 60, (height/2) + 15);

    noStroke();
    int c = color(playersColor[0], playersColor[1], playersColor[2], scoreAlpha);
    fill(c);
    text("zero", (width*3/4) - 60, (height/2) + 15);


    if(points == 7){
      oppositePoint = 0;
    }


}
  public void settings() {  size(1000, 500); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "Pong" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
