class SpaceFruit{
  PVector position;
  float size;

  public SpaceFruit(){
    position = new PVector(random(10, width - 10),
                           random(10, height - 10));
    size = 10;
  }

  void draw(){
    noStroke();
    fill(spaceAppleRed);
    ellipse(position.x, position.y, size, size);
  }
}
