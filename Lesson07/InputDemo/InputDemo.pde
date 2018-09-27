PVector position;
float speed = 5;

void setup(){
  size(1024, 1024);
  position = new PVector(width / 2, height / 2);
  ellipseMode(CENTER);
}

void draw(){
  background(255);
  float xMovment = getAxisRaw("Horizontal") * speed;
  position.x += xMovment;
  ellipse(position.x, position.y, 50, 50);
}
