class Zombie extends Character{

  PVector direction;
  color c = color(102, 205, 170);

  public Zombie(){
    super();
    direction = new PVector();
  }

  public Zombie(float x, float y){
    super(x, y);
    direction = new PVector();
  }

  void update(){
    bounderies();
    PVector closestHuman = new PVector();
    closestHuman = whoIsClose(super.position);

    direction.set(closestHuman.x - position.x,
                  closestHuman.y - position.y);
    direction.normalize();
    position.add(direction);
    // position.x += velocity.x * 0.5;
    // position.y += velocity.y * 0.5;

    draw();
  }

  void draw(){

    fill(c);
    noStroke();
    ellipse(position.x, position.y, size, size);
    stroke(102, 225, 180);
    strokeWeight(3);
    line(position.x + size * 0.4,
         position.y,
         position.x + direction.x * size * 0.75 + size * 0.4,
         position.y + direction.y * size * 0.75);

    line(position.x - size * 0.4,
         position.y,
         position.x + direction.x * size * 0.75 - size * 0.4,
         position.y + direction.y * size * 0.75);
  }

  boolean isHuman(){
    return false;
  }
}
