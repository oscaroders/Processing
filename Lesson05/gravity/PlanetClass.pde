class Planet extends SpaceBall{

  float diam = 100;

  public Planet(){
    super();
  }

  public Planet(float x, float y){
    super(x, y);
  }

  public Planet(float x, float y, color c){
    super(x, y, c);
  }

  void draw(){
    fill(c);
    noStroke();
    ellipse(position.x, position.y, diam, diam);
  }
}
