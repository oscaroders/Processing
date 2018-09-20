float diam = 50;
PVector circleVec = new PVector(500, 250);
PVector vec1 = new PVector(circleVec.x, circleVec.y);

void setup(){
  size(1000,500);
}

void draw(){
  background(255);

  stroke(0);
  ellipse(circleVec.x, circleVec.y, diam, diam);
  line(circleVec.x, circleVec.y, circleVec.x + vec1.x * diam/2, circleVec.y + vec1.y * diam/2);
  move();

}

void move(){
    vec1.set(mouseX - circleVec.x, mouseY - circleVec.y);
    vec1.normalize();
    circleVec.add(vec1);
}
