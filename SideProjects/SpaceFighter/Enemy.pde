public class Enemy extends Object{

  public Enemy(){
    position = new PVector();
    int side2side = (int)random(1, 4.99);
    if (side2side == 1){
      position.x = random(-200, -50);
      position.y = random(0, height);
    }

    if (side2side == 2){
      position.x = random(0, width);
      position.y = random(-200, -50);
    }

    if (side2side == 3){
      position.x = random(width + 50, width + 200);
      position.y = random(0, height);
    }

    if (side2side == 4){
      position.x = random(0, width);
      position.y = random(height + 50, height + 200);
    }
  }

  void update(){

  }

  void draw(){

  }

  void setDirection(){
    direction.set(closestPlayer(position).x - position.x, closestPlayer(position).y - position.y);
    direction.normalize();
  }
}
