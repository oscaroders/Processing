class CharacterManager{

  int numberOfCharacters;
  Human[] humans;

  public CharacterManager(int numberOfCharacters){
    this.numberOfCharacters = numberOfCharacters;
  }

  void spawn(){
    humans = new Human[numberOfCharacters];
    for(int i = 0; i < numberOfCharacters; i++){
      humans[i] = new Human();
    }
    // Zombie zombie = new Zombie();
    // zombie = humans[0];
  }

  void update(){
    for(int i = 0; i < numberOfCharacters; i++){
      print("update");
      humans[i].update();
    }
  }
}
