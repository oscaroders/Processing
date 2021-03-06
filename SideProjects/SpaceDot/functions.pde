void drawBackground(){
  background(spaceBlue);

  if(firstItt){
    generateBackground();
  }

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

void displayScore(){
  textAlign(CENTER,TOP);
  textSize(40);
  fill(scoreTextGreen);
  text("score: " + paul.dot.score, width / 2, 10);
}

void gameOver(){
  fill(255);
  textAlign(CENTER, TOP);
  if(gameOver){
    if(endTime == 0)
      endTime = round(currentTime * 0.001);
    text("game over", width / 2, 200);
    text("You survived the cold space \nin " + endTime + " seconds", width / 2, 320);
  }
}
