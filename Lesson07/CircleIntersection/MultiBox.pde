public class MultiBox extends Shape{
  public Box center;
  public Box inLeft, inRight, inTop, inBot;
  public Box onLeft, onRight, onTop, onBot;

  float velocityY = 160, velocityX = 0, acceleration = 5;
  PVector velocity;
  float w, h, xSpeed = 5;

  public MultiBox(float x, float y, float w, float h){
    super(x, y);

    velocity = new PVector(velocityX, velocityY);

    this.w = w;
    this.h = h;

    center = new Box(x, y, w, h);

    inLeft = new Box(x - w * 0.5 + 2, y, 2, 10);
    inRight = new Box(x + w * 0.5 - 2, y, 2, 10);
    inTop = new Box(x, y - h * 0.5 + 2, 10, 2);
    inBot = new Box(x, y + h * 0.5 - 2, 10, 2);

    onLeft = new Box(x - w * 0.5 - 1, y, 2, 10);
    onRight = new Box(x + w * 0.5 + 1, y, 2, 10);
    onTop = new Box(x, y - h * 0.5 - 1, 10, 2);
    onBot = new Box(x, y + h * 0.5 + 1, 10, 2);
  }

  public void update(float dt){
    super.update(dt);

    center.set(pos.x, pos.y, w, h);

    inLeft.set(pos.x - w * 0.5 + 2, pos.y, 2, 10);
    inRight.set(pos.x + w * 0.5 - 2, pos.y, 2, 10);
    inTop.set(pos.x, pos.y - h * 0.5 + 2, 10, 2);
    inBot.set(pos.x, pos.y + h * 0.5 - 2, 10, 2);

    onLeft.set(pos.x - w * 0.5 - 1, pos.y, 2, 10);
    onRight.set(pos.x + w * 0.5 + 1, pos.y, 2, 10);
    onTop.set(pos.x, pos.y - h * 0.5 - 1, 10, 2);
    onBot.set(pos.x, pos.y + h * 0.5 + 1, 10, 2);

    movment();
    jump();
    draw();
  }

  void draw(){
    rectMode(CENTER);
    rect(pos.x, pos.y, center.size.x, center.size.y);
  }

  public boolean inGround(Box other){
    return inBot.intersectsBox(other);
  }

  public boolean onGround(Box other){
    return onBot.intersectsBox(other);
  }

  void fall(Box other){
    if(!(onBot.intersectsBox(other))){
      velocity.set(velocity.x, velocity.y + acceleration);
      pos.y += velocity.y * _dt;
      pos.x += velocity.x * _dt;
    } else {
      pos.y = pos.y;
      pos.x = pos.x;
    }
  }

  void jump(){

  }

  void movment(){
    float xMovment = getAxisRaw("Horizontal") * xSpeed;
    pos.x += xMovment;
  }
}
