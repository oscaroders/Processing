class SpaceBall{

  PVector position;
  PVector velocity;
  PVector distanceBetween;
  color c;
  float diam = 10;
  float distanceBetweenX, distanceBetweenY;
  boolean timeToTurn;
  float acc = 5;

  public SpaceBall(){
    position = new PVector();
    position.x = random(0, width);
    position.y = random(0, height);

    velocity = new PVector();
    velocity.x = random(1, 2);
    velocity.y = random(1, 2);

    distanceBetween = new PVector();

    c = color(random(10, 245),
              random(10, 245),
              random(10, 245));
  }

  public SpaceBall(color c){
    position = new PVector();
    position.x = random(0, width);
    position.y = random(0, height);

    velocity = new PVector();
    velocity.x = random(0.1, 2);
    velocity.y = random(0.1, 2);

    distanceBetween = new PVector();

    this.c = c;
  }

  public SpaceBall(float x, float y){
    position = new PVector(x, y);

    velocity = new PVector();
    velocity.x = random(0.1, 2);
    velocity.y = random(0.1, 2);

    distanceBetween = new PVector();

    c = color(random(10, 245),
              random(10, 245),
              random(10, 245));
  }

  public SpaceBall(float x, float y, color c){
    position = new PVector(x, y);

    velocity = new PVector();
    velocity.x = random(0.1, 2);
    velocity.y = random(0.1, 2);

    this.c = c;
  }

  void draw(){
    update();

    fill(c);
    noStroke();
    ellipse(position.x, position.y, diam, diam);
  }

  void update(){

    distanceBetween();

  //  distanceBetween.mult(distanceBetween.mag() * tpf);

    velocity.add(distanceBetween);
    position.add(velocity);
  }

  void distanceBetween(){

    distanceBetween.set((position.x - planet.position.x) * -1, (position.y - planet.position.y) * -1);

    distanceBetween.normalize();

  }
}
