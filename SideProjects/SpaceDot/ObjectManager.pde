class ObjectManager{

  SpaceFruit apple;
  Missile[] missy;
  Dot dot;


  public ObjectManager(){

  }

  void spawnFruit(){
    apple = new SpaceFruit();
  }

  void spawnMissile(int numberOfMissiles){
    missy = new Missile[numberOfMissiles];
      for(int i = 0; i < numberOfMissiles; i++){
        missy[i] = new Missile((int)random(1, 5));
      }
  }

  void spawnDot(String name){
    dot = new Dot(name);
  }

  void update(){
    if(firstItt || hasEaten(dot.position.x,
                            dot.position.y,
                            dot.size,

                            apple.position.x,
                            apple.position.y,
                            apple.size)){
      spawnFruit();

    }


    apple.draw();
    dot.update();
    eatFruit();
    shootMissile();
    collision();
  }

  void eatFruit(){
    if(hasEaten(dot.position.x,
                dot.position.y,
                dot.size,

                apple.position.x,
                apple.position.y,
                apple.size)){
      dot.incScore();
    }
  }

  boolean hasEaten(float x1, float y1, float size1, float x2, float y2, float size2){
    return hasCollided(x1, y1, size1, x2, y2, size2);
  }

  void shootMissile(){
    for(int i = 0; i < numberOfMissiles; i++){
      missy[i].update();
    }
  }

  void collision(){
    for(int i = 0; i < numberOfMissiles; i++){
      if(hasCollided(dot.position.x,
                     dot.position.y,
                     dot.size,

                     missy[i].position.x,
                     missy[i].position.y,
                     missy[i].size)){
        gameOver = true;
      }
    }
  }

  boolean hasCollided(float x1, float y1, float size1, float x2, float y2, float size2){
    float maxDistance = size1 / 2 + size2 / 2;

    if(abs(x1 - x2) > maxDistance || abs(y1 - y2) > maxDistance){
      return false;
    } else if(dist(x1, y1, x2, y2) > maxDistance) {
      return false;
    } else {
      return true;
    }
  }
}
