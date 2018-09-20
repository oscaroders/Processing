class Zombie extends Human{

  color c = color(102, 205, 170);

  public Zombie(){
    super();
  }

  void update(){
    position.x += velocity.x * 0.5;
    position.y += velocity.y * 0.5;

    draw();
  }

  void draw(){
    
    fill(c);
    noStroke();
    rect(position.x, position.y, size, size);
  }

}
