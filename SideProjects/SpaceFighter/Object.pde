public class Object{

  PVector position;
  PVector direction;

  float size, speed;
  int bulletCounter;
  Bullet[] bullets;

  // Constructors --------------------------------------------------------------
  public Object(){
    position = new PVector();
    position.x = random(width);
    position.y = random(height);
    direction = new PVector();
    this.size = 50;
  }

  public Object(float size){
    position = new PVector();
    position.x = random(width);
    position.y = random(height);
    direction = new PVector();
    this.size = size;
  }

  public Object(float x, float y){
    position = new PVector(x, y);
    direction = new PVector();
    this.size = 50;
  }

  public Object(float x, float y, float size){
    position = new PVector(x, y);
    direction = new PVector();
    this.size = size;
  }

  //Functions -----------------------------------------------------------------
  void update(){

  }

  void draw(){

  }

  PVector getPosition(){
    return position;
  }

  PVector getDirection(){
    return direction;
  }

  float getSize(){
    return size;
  }

  Bullet[] getBullets(){
    return bullets;
  }
}
