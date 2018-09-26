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
     speedX = (int)random(7, 9) * reverse;
     player1.scoreInc();
     setup();
  } else if ( x < 0 + ballDiam / 2) {
     gameStart = !gameStart;
     speedX = (int)random(7, 9) * reverse;
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
   if(gameOver == true && keyCode == ENTER) {
     println("enter");
     player1.setScore(0);
     player2.setScore(0);
     speedX = (int)random(7, 9) * reverse;
     speedY = (int)random(7, 9) * reverse;
     setup();
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
  gameOver = true;
}
