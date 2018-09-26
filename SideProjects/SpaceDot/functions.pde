drawBackground(){
  background(0);

  if(firstItt){
    generateBackground();
  }

  for(int i = 0; i < numberOfStars; i++){
    stroke(255);
    strokeWeight(3);
    point(starPos[i].x, starPos[i].y);
  }
}

void generateBackground(){
  for(int i = 0; i < numberOfStars; i++){
    starPos[i] = new PVector(random(0, width),
                             random(0, height));
  }
}
