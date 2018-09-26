class ObjectManager{

  SpaceFruit apple;
  Dot dot;

  public ObjectManager(){

  }

  void spawnFruit(){
    apple = new SpaceFruit();
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
