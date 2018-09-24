public class Player {

  String name;
  color playerColor;
  int score;

  public Player(String name, color playerColor, int score){
    this.name = name;
    this.playerColor = playerColor;
    this.score = score;
  }

  void scoreInc(){
    score++;
  }

  int getScore(){
    return score;
  }

  void setScore(int point){
    score = point;
  }

  String scoreInText(){
      String score1 = "zero";
      int points = score + 1;
      switch (points){
          case 1:  score1 = "zero";
          break;
          case 2:  score1 = "one";
          break;
          case 3:  score1 = "two";
          break;
          case 4:  score1 = "three";
          break;
          case 5:  score1 = "four";
          break;
          case 6:  score1 = "five";
          break;
          case 7:  score1 = "six";
          break;
          case 8:  score1 = "seven";
          break;
          case 9:  score1 = "eight";
          break;
          case 10:  score1 = "nine";
          break;
          case 11:  score1 = "ten";
          break;
      }
      return score1;
  }
}

// variable declerations ----------------------------------------------------

boolean  gameStart;
boolean upPlayer1, downPlayer1;
boolean upPlayer2, downPlayer2;
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
float winScore = 10;

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

void drawCourt(){
  background(255);

  //middleLine
  noStroke();
  fill(middleLineColor);
  rect((width / 2) - 5, 0, 10, height);

  //drawes the ball
  noStroke();
  fill(ballColor);
  rect(x - ballDiam / 2, y - ballDiam / 2, ballDiam, ballDiam);

  //player1 paddle
  noStroke();
  fill(player1Color);
  rect(paddlePlayer1X, paddlePlayer1Y, paddleWidth, paddleHeight);

  //player2 paddle
  noStroke();
  fill(player2Color);
  rect(paddlePlayer2X, paddlePlayer2Y, paddleWidth , paddleHeight);
}

void bounderies(){
  if(y + ballDiam / 2 > windowHeight || y - ballDiam / 2 < 0){
      speedY *= reverse;
      y = y + speedY;
  }
}

void paddleMove() {
  if (upPlayer1) {
    paddlePlayer1Y -= paddleSpeed;
  }
  if (downPlayer1) {
    paddlePlayer1Y += paddleSpeed;
  }
  if (upPlayer2) {
    paddlePlayer2Y -= paddleSpeed;
  }
  if (downPlayer2) {
    paddlePlayer2Y += paddleSpeed;
  }
}

void paddleRestriction() {
  if (paddlePlayer1Y  < 0) {
    paddlePlayer1Y += paddleSpeed;
  }
  if (paddlePlayer1Y + paddleHeight > height) {
    paddlePlayer1Y -= paddleSpeed;
  }
  if (paddlePlayer2Y  < 0) {
    paddlePlayer2Y += paddleSpeed;
  }
  if (paddlePlayer2Y + paddleHeight > height) {
    paddlePlayer2Y -= paddleSpeed;
  }
}

void paddleBounce() {
  if (x - ballDiam / 2 < paddlePlayer1X  && y - ballDiam / 2 < paddlePlayer1Y + paddleHeight && y + ballDiam / 2 > paddlePlayer1Y) {
    if (speedX < 0) {
      speedX *= reverse;
    }
  }
  else if (x + ballDiam / 2 > paddlePlayer2X - paddleWidth / 2 && y - ballDiam / 2 < paddlePlayer2Y + paddleHeight && y + ballDiam / 2 > paddlePlayer2Y) {
    if (speedX > 0) {
      speedX *= reverse;
    }
  }
}

void displayScore(){
  detectScore();

  fill(player1.playerColor);
  String p1 = player1.scoreInText();
  text(p1, 240, 50);
  fill(player2.playerColor);
  String p2 = player2.scoreInText();
  text(p2, width - 240, 50);
}

void detectScore(){
  if ( x > width - ballDiam / 2) {
     gameStart = !gameStart;
     speedX *= reverse;
     player1.scoreInc();
     setup();
  } else if ( x < 0 + ballDiam / 2) {
     gameStart = !gameStart;
     speedX *= reverse;
     player2.scoreInc();
     setup();
  }
}

void keyPressed(){
   if(keyCode == ENTER){
     gameStart = !gameStart;
   }
   if (key == 'w' || key == 'W') {
     upPlayer1 = true;
   }
   if (key == 's' || key == 'S') {
     downPlayer1 = true;
   }
   if (key == 'o' || key == 'O') {
     upPlayer2 = true;
   }
   if (key == 'l' || key == 'L') {
     downPlayer2 = true;
 }
}

void keyReleased(){
  if (key == 'w' || key == 'W') {
    upPlayer1 = false;
  }
  if (key == 's' || key == 'S') {
    downPlayer1 = false;
  }
  if (key == 'o' || key == 'O') {
    upPlayer2 = false;
  }
  if (key == 'l' || key == 'L') {
    downPlayer2 = false;
  }
}

void gameOver() {
  if(player1.getScore() == winScore) {
    gameOverPage(player1.name + " wins!", player1.playerColor);
  }
  if(player2.getScore() == winScore) {
    gameOverPage(player2.name + " wins!", player2.playerColor);
  }
}

void gameOverPage(String text, color c) {
  speedX = 0;
  speedY = 0;
  fill(0);
  text("Game over", width/2, height/3 - 40);
  text("Press ENTER to play again", width/2, height/3 + 40);
  fill(c);
  text(text, width/2, height/3);
  if(keyPressed == true && keyCode == ENTER) {
    player1.setScore(0);
    player2.setScore(0);
    speedX = 1;
    speedY = 1;
  }
}
