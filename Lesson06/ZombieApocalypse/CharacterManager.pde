class CharacterManager{

  int numberOfCharacters;
  Character[] characters;
  Zombie zombie;

  public CharacterManager(int numberOfCharacters){
    this.numberOfCharacters = numberOfCharacters;
  }

  void spawn(){
    characters = new Character[numberOfCharacters];
    for(int i = 0; i < numberOfCharacters - 1; i++){
      characters[i] = new Human();
    }
    zombie = new Zombie();
    characters[numberOfCharacters - 1] = zombie;
  }

  void update(){
    collision();

    for(int i = 0; i < numberOfCharacters; i++){
      characters[i].update();
    }
  }

  void collision(){
    Zombie bittenZombie;
    for(int i = 0; i < numberOfCharacters; i++){
      if(!characters[i].isHuman()){
        for(int j = 0; j < numberOfCharacters; j++){
          if(characters[j].isHuman() &&
             hasCollided(characters[i].position.x,
                         characters[i].position.y,
                         characters[i].size,

                         characters[j].position.x,
                         characters[j].position.y,
                         characters[j].size) ) {
            bittenZombie = new Zombie(characters[j].position.x,
                                      characters[j].position.y);
            characters[j] = bittenZombie;
          }
        }
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
