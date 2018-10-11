public class GameObject{

  float x;
  float y;
  float size;
  int numberOfNeighbours;
  int aliveCount, deadCount, fader = 255;
  color green = color(0, 255, 28);
  boolean beenActive;

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
      beenActive = true;
      if(aliveCount < 2){
        fill(green);
        rect(x, y, size, size);
      } else {
        fill(aliveCount, y / 255, 28 + aliveCount);
        rect(x, y, size, size);
      }
      aliveCount += 30;
      deadCount = 0;
      if(aliveCount > 255){
        aliveCount = 255;
      }
    }
    if(!alive){
      if(deadCount < 1){
        fill(139, 0, 0);
        rect(x, y, size, size);
      } else if(beenActive) {
        fill(220, 0 + (deadCount * 25 * 2), 0 + (deadCount * 25 * 2));
        rect(x, y, size, size);
      } else {
        fill(255, 255, 255);
        rect(x, y, size, size);
      }
      deadCount++;
      aliveCount = 0;
      if(deadCount > 5){
        deadCount = 5;
      }
    }
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
