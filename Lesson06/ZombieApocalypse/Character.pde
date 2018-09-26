public class Character{

  PVector position;
  PVector velocity;
  float size;
  color c = color(0);
  float maxSpeed = 3;
  float minSpeed = 1;

  public Character(){
    position = new PVector();
    position.x = random(0, width);
    position.y = random(0, height);

    velocity = new PVector();
    velocity.x = random(minSpeed,  maxSpeed) * random(-1, 1);
    velocity.y = random(minSpeed,  maxSpeed) * random(-1, 1);

    size = random(20, 25);
  }

  public Character(float x, float y){
    position = new PVector(x, y);

    velocity = new PVector();
    velocity.x = random(minSpeed,  maxSpeed) * random(-1, 1);
    velocity.y = random(minSpeed,  maxSpeed) * random(-1, 1);

    size = random(20, 25);
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
      position.x = width;

    if(position.x > width)
      position.x = 0;

    if(position.y < 0)
      position.y = height;

    if(position.y > height)
      position.y = 0;
  }

  void timeToTurn(){
    int counter = millis();
    if(counter % 100 == (int)random(0,10)){
      velocity.y = random(minSpeed,  maxSpeed);
    } else if(counter % 100 == (int)random(20,30)){
      velocity.y = random(minSpeed,  maxSpeed) * -1;
    } else if(counter % 100 == (int)random(50,60)){
      velocity.x = random(minSpeed,  maxSpeed);
    } else if(counter % 100 == (int)random(70,80)){
      velocity.x = random(minSpeed,  maxSpeed) * -1;
    }
  }

  boolean isHuman(){
    return true;
  }
}
