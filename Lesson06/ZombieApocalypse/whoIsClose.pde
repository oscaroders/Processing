PVector whoIsClose(PVector position){

  PVector closestHuman = new PVector();
  PVector closest;
  float closestF = 1000;
  float tempDist;
  closest = new PVector(0, 0);

  for(int i = 0; i < ralf.numberOfCharacters ; i++){
    if(ralf.characters[i].isHuman()){

      if((ralf.characters[i].position.x < position.x + 300 &&
         ralf.characters[i].position.x > position.x - 300) &&
        (ralf.characters[i].position.y < position.y + 300 &&
         ralf.characters[i].position.y > position.y - 300)){

         tempDist = dist(ralf.characters[i].position.x,
                         ralf.characters[i].position.y,
                         position.x,
                         position.y);

         if(tempDist < closestF){
           closestF = tempDist;
           closest.set(ralf.characters[i].position.x, ralf.characters[i].position.y) ;

        }
      }
    }
  }
  return closestHuman.set(closest.x ,closest.y);
}


// donsent work
void gameOver(){
  float endTime = 0;
  PFont bloodFont;
  bloodFont = createFont("bloodFont.otf", 76);
  textFont(bloodFont);
  fill(178, 34, 34);
  textAlign(CENTER, BOTTOM);
  if(ralf.areAllDead()){
    if(!gameOver){
      endTime = millis() * 0.001;
      gameOver = true;
    }
    text("game over", 450, 200);
    text("the viris took over in " + endTime + " seconds", 450, 280);
  }
}
