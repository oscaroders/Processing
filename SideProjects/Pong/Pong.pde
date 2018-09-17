boolean gameStart = false;
int windowWidth = 1000;
int windowHeight = 500;
color ballColor = color(128, 128, 128);
color player1Color = color(255, 0, 0);
int scoreAlpha = 100;
color player2Color  = color(0, 255, 0);
color middleLineColor = color(240, 240, 240);
int diam = 20;
int x = (int)random(50, 400);
int y = (int)random(50, 450);
int paddleWidth = 10;
int paddleHeight = 100;
int paddleSpeed = 10;
int player1PaddlePositionX = 1000-paddleWidth;
int player2PaddlePositionX = 0;
int player1PaddlePositionY = 0;
int player2PaddlePositionY = 0;
int middleLineWidth = 10;
int middleLinePosition = 500-middleLineWidth/2;
int speedX = (int)random(7, 9);
int speedY = (int)random(7, 9);
int reverse = -1;
int player1Score = 0;
int player2Score = 0;


void setup()
{
  size(1000, 500);
}

void draw(){

    Player player1 = new Player("Oscar", player1Color);
    Player player2 = new Player("Ingrid", player2Color);

    if(gameStart){
        x = x + speedX;
        y = y + speedY;
    }

    drawCourt();
    bounderies();
    paddleBounce();
    scoreCheck(player1, player2);
}

 void keyPressed(){
    gameStart = !gameStart;
}

void drawCourt(){
  background(255);

  paddleMove();

  //middleLine
  noStroke();
  fill(middleLineColor);
  rect(middleLinePosition, 0, middleLineWidth, 500);

  //drawes the ball
  noStroke();
  fill(ballColor);
  ellipse(x, y, diam, diam);

  //player1 paddle
  //player1PaddlePositionY = mouseY;
  noStroke();
  fill(player1Color);
  rect(player1PaddlePositionX, player1PaddlePositionY, paddleWidth, paddleHeight);

  //oplayer2 paddle
  //player2PaddlePositionY = y - paddleHeight/2;
  noStroke();
  fill(player2Color);
  rect(player2PaddlePositionX, player2PaddlePositionY, paddleWidth, paddleHeight);
}

void paddleMove(){
  if(keyPressed == true && key == 'o'){
    player1PaddlePositionY -= 6;
  }
  if(keyPressed == true && key == 'l'){
    player1PaddlePositionY += 6;
  }

  if(keyPressed == true && key == 'w'){
    player2PaddlePositionY -= 6;
  }
  if(keyPressed == true && key == 's'){
    player2PaddlePositionY += 6;
  }
}

void bounderies(){
  if(y+diam/2 > windowHeight || y-diam/2 < 0){
      speedY = speedY*reverse;
      y = y + speedY;
  }
}

void paddleBounce(){
  if((x+diam/2 > windowWidth - paddleWidth) && ((y > player1PaddlePositionY && y < player2PaddlePositionY + paddleHeight))){
      speedX = speedX*reverse;
      x = x + speedX;
      y = (y + (int)random(2, 5)) + speedY;
  }

  if((x-diam/2 < 0 + paddleWidth) && (y > player2PaddlePositionY && y < player2PaddlePositionY + paddleHeight)){
      speedX = speedX*reverse;
      x = x + speedX;
      y = (y + (int)random(2, 5)) + speedY;
  }
}

void scoreCheck(Player player1, Player player2){
  if(x > windowWidth || x < 0){
      gameStart = false;
      x = (int)random(50, 400);
      y = (int)random(50, 450);
      speedX = (int)random(7, 9);
      speedY = (int)random(7, 9);

      if (x > windowWidth){
        player1Score++;
        player1.scoreDisplay(player1Score);
      } else if(x < 0){
        player2Score++;
        player2.scoreDisplay(player2Score);
      } else {
        return;
      }
  }
}


public class Player {

  String name;
  color playerColor;

  public Player(String name, color playerColor){
    this.name = name;
    this.playerColor = playerColor;
  }

  void scoreDisplay(int point)
  {
      String score = "zero";
      switch (point){
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
          case 7:  score = name + " WINS!";
          break;
      }

      int textHeight = 62;
      textSize(textHeight);
      fill(playerColor);
      text(score, (width/4) - 60, (height/2) + 15);

  }
}
