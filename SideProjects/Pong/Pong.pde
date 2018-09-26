boolean  gameStart;
boolean upPlayer1, downPlayer1;
boolean upPlayer2, downPlayer2;
boolean gameOver = false;
color ballColor = color(128, 128, 128);
color player1Color = color(255, 0, 0);
color player2Color  = color(0, 255, 0);
color middleLineColor = color(240, 240, 240);
float windowWidth = 1000, windowHeight = 500;
float ballDiam = 20;
float paddleWidth = 10, paddleHeight = 100, paddleSpeed = 10;
float paddlePlayer1X = 10, paddlePlayer1Y = windowHeight / 2;
float paddlePlayer2X = windowWidth - paddleWidth -10, paddlePlayer2Y = windowHeight / 2;
float speedX = (int)random(7, 9), speedY = (int)random(7, 9);
float reverse = -1, x, y;
float winScore = 10; // max 10!!

void setup(){
  size(1000, 500);
  textAlign(CENTER, CENTER);
  textSize(30);
  x = width / 2;
  y = height / 2;
}

Player player1 = new Player("Oscar", player1Color, 0);
Player player2 = new Player("Ingrid", player2Color, 0);

void draw(){

  drawCourt();

  if(gameStart){
      x = x + speedX;
      y = y + speedY;
  }

  bounderies();
  paddleMove();
  paddleRestriction();
  paddleBounce();
  displayScore();
  gameOver();
}
