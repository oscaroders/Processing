boolean gameStart = false;
int windowWidth = 1000;
int windowHeight = 500;
int[] ballColour = {128, 128, 128};
int[] paddleColour = {128, 128, 128};
int[] middleLineColour = {240, 240, 240};
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
int speedX = (int)random(4, 6);
int speedY = (int)random(4, 6);
int reverse = -1;


void setup()
{
  size(1000, 500);
}

void draw()
{
    background(255);
    //middleLine
    stroke(middleLineColour[0], middleLineColour[1], middleLineColour[2]);
    fill(middleLineColour[0], middleLineColour[1], middleLineColour[2]);
    rect(middleLinePosition, 0, middleLineWidth, 500);
    
    //drawes the ball
    stroke(ballColour[0], ballColour[1], ballColour[2]);
    fill(ballColour[0], ballColour[1], ballColour[2]);
    ellipse(x, y, diam, diam);
    
    //players paddle
    playersPaddlePositionY = mouseY;
    stroke(paddleColour[0], paddleColour[1], paddleColour[2]);
    fill(paddleColour[0], paddleColour[1], paddleColour[2]);
    rect(playersPaddlePositionX, playersPaddlePositionY, paddleWidth, paddleHeight);
    
    //opposite paddle
    oppositePaddlePositionY = y - paddleHeight/2;
    stroke(paddleColour[0], paddleColour[1], paddleColour[2]);
    fill(paddleColour[0], paddleColour[1], paddleColour[2]);
    rect(oppositePaddlePositionX, oppositePaddlePositionY, paddleWidth, paddleHeight);    
    
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
        speedX = (int)random(4, 6);
        speedY = (int)random(4, 6);
        
    }

}

void mousePressed() 
{
    gameStart = !gameStart;
}
