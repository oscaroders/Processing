class Human{

  PVector position;
  PVector velocity;
  float size;
  color c = color(255, 160, 122);

  public Human(){
    position = new PVector();
    position.x = random(0, width);
    position.y = random(0, height);

    velocity = new PVector();
    velocity.x = random(3, 5) * random(-1, 1);
    velocity.y = random(3, 5) * random(-1, 1);

    size = random(9, 12);
  }

  void update(){
    position.x += velocity.x;
    position.y += velocity.y;

    draw();
  }

  void draw(){
    fill(c);
    noStroke();
    rect(position.x, position.y, size, size);
  }
}
