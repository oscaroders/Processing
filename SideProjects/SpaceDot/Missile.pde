class Missile{

  PVector position;
  int side;
  int size;
  float speed;

  public Missile(int side){
    this.side = side;
    if(this.side == 1)
      position = new PVector(0, random(10, height - 10));
    if(this.side == 2)
      position = new PVector(random(10, width - 10), 0);
    if(this.side == 3)
      position = new PVector(width, random(10, height - 10));
    if(this.side == 4)
      position = new PVector(random(10, width - 10), height);
    if(this.side > 4)
      position = new PVector(0, height / 2);

    size = 5;
    speed = random(1,4);
  }

  void update(){
    if(this.side == 1)
      position.set(position.x + speed, position.y);
    if(this.side == 2)
      position.set(position.x, position.y + speed);
    if(this.side == 3)
      position.set(position.x - speed, position.y);
    if(this.side == 4)
      position.set(position.x, position.y - speed);
    if(this.side > 4)
      position.set(position.x, position.y + speed);
  }

  void draw(){
    if(side == 1 || side == 3){
      rect(position.x, position.y, size, size * 2);
    } else if(side == 2 || side == 4){
      rect(position.x, position.y, size * 2, size);
    } else {
      rect(position.x, position.y, size, size * 2);
    }
  }

}
