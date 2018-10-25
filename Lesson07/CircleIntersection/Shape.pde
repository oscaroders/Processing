public abstract class Shape{
  public PVector pos;

  public Shape(float x, float y){
    pos = new PVector(x, y);
  }

  public void update(float dt){
  }

  boolean isBox(){
    return false;
  }

  boolean isCircle(){
    return false;
  }

  boolean isLine(){
    return false;
  }
}
