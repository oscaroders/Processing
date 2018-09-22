public class Character{

  PVector position;
  PVector velocity;
  float size;
  color c = color(0);

  public Character(){
    position = new PVector();
    position.x = random(0, width);
    position.y = random(0, height);

    velocity = new PVector();
    velocity.x = random(3, 5) * random(-1, 1);
    velocity.y = random(3, 5) * random(-1, 1);

    size = random(15, 18);
  }

  public Character(float x, float y){
    position = new PVector(x, y);

    velocity = new PVector();
    velocity.x = random(3, 5) * random(-1, 1);
    velocity.y = random(3, 5) * random(-1, 1);

    size = random(15, 18);
  }

  void update(){
    bounderies();
    timeToTurn();

    position.x += velocity.x;
    position.y += velocity.y;


    draw();
  }

  void draw(){
    fill(c);
    noStroke();
    rect(position.x, position.y, size, size);
  }

  void bounderies(){
    if(position.x < 0)
      position.x = height;

    if(position.x > height)
      position.x = 0;

    if(position.y < 0)
      position.y = width;

    if(position.y > width)
      position.y = 0;
  }

  void timeToTurn(){
    int counter = millis();
    if(counter % 100 == (int)random(0,10)){
      velocity.y = random(3, 5);
    } else if(counter % 100 == (int)random(20,30)){
      velocity.y = random(3, 5) * -1;
    } else if(counter % 100 == (int)random(50,60)){
      velocity.x = random(3, 5);
    } else if(counter % 100 == (int)random(70,80)){
      velocity.x = random(3, 5) * -1;
    }
  }

  boolean isHuman(){
    return true;
  }
}
