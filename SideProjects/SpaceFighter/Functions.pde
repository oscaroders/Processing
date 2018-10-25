boolean singlePlayerGame(){
  return gameManager.singlePlayerGame();
}

boolean multiPlayerGame(){
  return gameManager.multiPlayerGame();
}

void drawBackground(){
  background(spaceBlue);
  for(int i = 0; i < numberOfStars; i++){
    if(backgcount % (int)random(7, 23) == 0){
      stroke(lightYellow);
      strokeWeight(random(2, 5));
    } else {
      stroke(yellow);
      strokeWeight(2);
    }
    point(starPos[i].x, starPos[i].y);
    backgcount++;
  }
}

void generateBackground(){
  for(int i = 0; i < numberOfStars; i++){
    starPos[i] = new PVector(random(0, width),
                             random(0, height));
  }
}

void loadSprites(){
  mainSpaceShip = loadImage("/sprites/MainSpaceShip.png");
}

PVector closestPlayer(PVector position){
  if(multiPlayerGame()){
    float distanceToPlayer1 = sq(abs(position.x - player1.position.x)) + sq(abs(position.y - player1.position.y));
    float distanceToPlayer2 = sq(abs(position.x - player2.position.x)) + sq(abs(position.y - player2.position.y));
    if(distanceToPlayer1 < distanceToPlayer2){
      return player1.position;
    } else {
      return player2.position;
    }
  } else {
    return player1.position;
  }
}
