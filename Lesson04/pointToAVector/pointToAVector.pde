PVector vec1 = new PVector();
int windowWidth = 1000;
int windowHeight = 500;
int vecX = (int)random(0, windowWidth);
int vecY = (int)random(0, windowHeight);
int score;
boolean hasClicked = false;
int x;
int y;

void setup(){
  size(1000, 500);
}

void draw(){
  background(255);
  vec1.set(vecX, vecY);
  message();
  drawPoint();
}

void message(){
  String mess = "Click on (" + vec1.x +", " + vec1.y +")";
  String feedBack = "You were " + abs(vec1.x - x) + " in x, and " + abs(vec1.y - y) + " in y from the point.";
  String feedBack2 = "I, the computer, feel like giving you " + score + " as a score!";

  if(hasClicked){
    fill(0);
    textSize(25);
    textAlign(CENTER, BOTTOM);
    text(feedBack,  width/2, 40);
    textAlign(CENTER, TOP);
    text(feedBack2, width/2, 40);
  } else {
    fill(0);
    textSize(20);
    textAlign(CENTER, BOTTOM);
    text(mess, width/2, 40);
  }
}

void drawPoint(){
  mousePressed();
  stroke(0);
  strokeWeight(5);
  point(x, y);
}

void mousePressed(){
  if(mousePressed){
    x = mouseX;
    y = mouseY;
    score = (int)random(1, 100);
    hasClicked = true;
  }
}
