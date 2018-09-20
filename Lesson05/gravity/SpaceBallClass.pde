class SpaceBall{

  PVector position;
  PVector velocity;
  color c;
  float diam = 10;
  float distanceBetweenX, distanceBetweenY;
  boolean timeToTurn;

  public SpaceBall(){
    position = new PVector();
    position.x = random(0, width);
    position.y = random(0, height);

    velocity = new PVector();
    velocity.x = random(1, 2);
    velocity.y = random(1, 2);

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

    this.c = c;
  }

  public SpaceBall(float x, float y){
    position = new PVector(x, y);

    velocity = new PVector();
    velocity.x = random(0.1, 2);
    velocity.y = random(0.1, 2);

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
    bounderis();

    distanceBetween();

    position.x -= (distanceBetweenX * tpf);
    position.y -= (distanceBetweenY * tpf);
  }

  void bounderis(){
    if(position.x < 0){
      //position.x *= -1;
      timeToTurn = false;
    }
    if(position.y < 0){
      //position.y *= -1;
      timeToTurn = false;
    }
    if(position.x > width){
      //position.x *= -1;
      timeToTurn = false;
    }
    if(position.y > height){
      //position.y *= -1;
      timeToTurn = false;
    }
  }

  void distanceBetween(){
    timeToTurn();

    if(timeToTurn){
      distanceBetweenX = (position.x - planet.position.x) * -1;
      distanceBetweenY = (position.y - planet.position.y) * -1;
    } else {
      distanceBetweenX = (position.x - planet.position.x);
      distanceBetweenY = (position.y - planet.position.y);
    }
  }

  void timeToTurn(){
    if((distanceBetweenX < 5 && distanceBetweenX > -5)
        && (distanceBetweenY < 5 && distanceBetweenY > -5)){
      timeToTurn = true;
    }
  }
}
