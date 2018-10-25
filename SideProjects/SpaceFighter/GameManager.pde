public class GameManager{

  boolean multiPlayerGame;

  // Constructor ---------------------------------------------------------------
  public GameManager(){

  }

  // Functions -----------------------------------------------------------------
  void setup(){
    initialObjectSetup();
    firstItt = true;
    starPos = new PVector[numberOfStars];
    generateBackground();
    loadSprites();
  }

  void update(){
    objectUpdate();
  }

  void draw(){
    drawBackground();
    objectDraw();
  }

  boolean singlePlayerGame(){
      return !multiPlayerGame;
  }

  boolean multiPlayerGame(){
    return multiPlayerGame;
  }
}
