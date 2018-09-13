boolean gameStart = false;
int windowWidth = 1000;
int windowHeight = 500;
int[] ballColor = {128, 128, 128};
int[] playersColor = {128, 128, 128};
int scoreRectangleAlpha = 240;
int[] oppositeColor  = {128, 128, 128};
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
int speedX = (int)random(4, 6);
int speedY = (int)random(4, 6);
int reverse = -1;
int playersPoint = 0;
int oppositePoint = 0;
String oppositeScore;


void setup()
{
  size(1000, 500);
}

void draw()
{
    background(255);

    noStroke();
    color c = color(playersColor[0], playersColor[1], playersColor[2], scoreRectangleAlpha);
    float valueC = alpha(c);
    fill(valueC);
    rect(250-100, (windowHeight/2)-50, 200, 100);

    noStroke();
    color d = color(playersColor[0], playersColor[1], playersColor[2], scoreRectangleAlpha);
    float valueD = alpha(d);
    fill(valueD);
    rect(750-100, (windowHeight/2)-50, 200, 100);

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
        speedX = (int)random(4, 6);
        speedY = (int)random(4, 6);
        oppositePoint++;
    }


}

void mousePressed()
{
    gameStart = !gameStart;
}

void pointCounter(int points)
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
    }

    textSize(32);
    fill(0);
    text(score, 10, 30);

}
