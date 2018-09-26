class Dot{
  PVector position;
  int score;
  String name;
  float size;

  public Dot(String name){
    this.name = name;
    position = new PVector(width / 2, height / 2);
    size = 30;
    score = 0;
  }

  void update(){
    position.set(mouseX, mouseY);
  }

  void draw(){
    fill(spaceDotPurple);
    ellipse(position.x ,position.y, size, size);
    fill(spaceDotPurple, 100);
    ellipse(pmouseX + size * 0.25 ,pmouseY + size * 0.25, size, size);
    fill(spaceDotPurple, 200);
    ellipse(pmouseX + size * 0.50 ,pmouseY + size * 0.50, size, size);
  }
}
