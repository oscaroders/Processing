public class GameObject{

  float x;
  float y;
  float size;
  int numberOfNeighbours;
  int aliveCount, deadCount, fader = 255;

  boolean alive;

  public GameObject(float x, float y, float size){
    this.x = x;
    this.y = y;
    this.size = size;
  }

  void update(){
    alive = ruleCheck();
  }

  void draw(){
    if(alive){
      fill(0, 255, 28);
    }
    if(!alive){
      fill(255, 0, 28);
    }
    rect(x, y, size, size);
  }

  void addNegihbourCount(int a){
    numberOfNeighbours = a;
  }

  boolean ruleCheck(){
    if(alive){
      if(numberOfNeighbours < 2 || numberOfNeighbours > 3)
        return false;
      return true;
    }
    if(numberOfNeighbours == 3)
      return true;
    return false;
  }
}
