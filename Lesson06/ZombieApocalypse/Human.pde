class Human extends Character{

  color c;

  public Human(){
    super();

    switch((int)random(1, 5.99)){
          case 1:  c = color(255, 160, 122);
          break;
          case 2:  c = color(210, 180, 140);
          break;
          case 3:  c = color(255, 240, 245);
          break;
          case 4:  c = color(139, 69, 19);
          break;
          case 5:  c = color(255, 250, 205);
          break;
    }
  }

  void draw(){
    fill(c);
    noStroke();
    rect(position.x, position.y, size, size);
    fill(255);
    ellipse(position.x + (size * 0.25), position.y + (size * 0.5) , size * 0.5, size * 0.5);
    ellipse(position.x + (size * 0.75), position.y + (size * 0.5) , size * 0.5, size * 0.5);
    fill(0);
    ellipse(position.x + (size * 0.5) - 3, position.y + (size * 0.5), 4, 4);
    ellipse(position.x + (size * 0.5) + 3, position.y + (size * 0.5), 4, random(4, 6));
  }
}
