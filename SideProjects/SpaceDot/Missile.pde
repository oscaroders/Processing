class Missile{

  PVector position;
  int side;
  int size;
  float speed;
  float maxOffset = height;

  public Missile(int side){
    this.side = side;
    if(this.side == 1)
      position = new PVector(random(-maxOffset, 0), random(10, height - 10));
    if(this.side == 2)
      position = new PVector(random(10, width - 10), random(-maxOffset, 0));
    if(this.side == 3)
      position = new PVector(random(width + maxOffset), random(10, height - 10));
    if(this.side == 4)
      position = new PVector(random(10, width - 10), random(height + maxOffset));
    if(this.side > 4)
      position = new PVector(0, height / 2);

    size = 15;
    speed = 100;
  }

  void update(){
    if(this.side == 1)
      position.set(position.x + speed * tpf, position.y);
    if(this.side == 2)
      position.set(position.x, position.y + speed * tpf);
    if(this.side == 3)
      position.set(position.x - speed * tpf, position.y);
    if(this.side == 4)
      position.set(position.x, position.y - speed * tpf);
    if(this.side > 4)
      position.set(position.x, position.y + speed * tpf);

    bounduries();
    draw();
  }

  void draw(){
    fill(0);
    if(side == 1 || side == 3){
      rect(position.x, position.y, size * 2, size);
    } else if(side == 2 || side == 4){
      rect(position.x, position.y, size, size * 2);
    } else {
      rect(position.x, position.y, size, size * 2);
    }
  }

  void bounduries(){
    if(position.x > width)
      position.set(0, position.y);
    if(position.x < 0)
      position.set(width, position.y);
    if(position.y > height)
      position.set(position.x, 0);
    if(position.x < 0)
      position.set(position.x, height);
  }

}
