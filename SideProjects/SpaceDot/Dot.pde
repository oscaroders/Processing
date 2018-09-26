class Dot{
  PVector position, move;
  int score;
  String name;
  float size;

  public Dot(String name){
    this.name = name;
    position = new PVector(width / 2, height / 2);
    move = new PVector(position.x, position.y);
    size = 30;
    score = 0;
  }

  void update(){
    move.set((mouseX - position.x) * tpf, (mouseY - position.y) * tpf);
    move.normalize();
    position.add(move);

    draw();
  }

  void draw(){
    noStroke();
    fill(spaceDotPurple);
    ellipse(position.x ,position.y, size, size);
  }

  void incScore(){
    score++;
  }
}
