PVector ballVec = new PVector(500, 250);
PVector ballPosVec = new PVector(500, 250);
float diam = 10;
float rad = diam/2;
float speedX = random(-5, 5);
float speedY = random(-5, 5);


void setup(){
  size(1000, 500);
}

void draw(){
  background(255);

  fill(0);
  ellipse(ballPosVec.x + ballVec.x, ballPosVec.y + ballVec.y, diam, diam);

  move();
  bounce();
}

void move(){
  ballVec.set(speedX , speedY);
  ballPosVec.add(ballVec);
}

void bounce(){
  if(ballPosVec.y > height - rad)
    speedY *= -1;

  if(ballPosVec.y < 0 + rad)
      speedY *= -1;

  if(ballPosVec.x > width - rad)
      speedX *= -1;

  if(ballPosVec.x < 0 + rad)
      speedX *= -1;
}
