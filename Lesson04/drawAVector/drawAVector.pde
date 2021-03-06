PVector vec1 = new PVector();
int windowWidth = 1000;
int windowHeight = 500;
int zeroX = (int)random(0, windowWidth);
int zeroY = (int)random(0, windowHeight);
int vecX = (int)random(0, windowWidth) - zeroX;
int vecY = (int)random(0, windowHeight) - zeroY;
float drawingX;
float drawingY;
float startX;
float startY;
float[] vecYValues = new float[windowWidth];
float[] drawYValues = new float[windowWidth];
int j = 0;
boolean firstItt = true;
float vectorAngle;
int score = 0;
int scoreDiv = 0;
boolean showScore = false;
boolean hasDrawn = false;
int myEverest = 0;

void setup(){
  size(1000, 500);
  background(255);
}

void draw(){
  message();
  drawMouse();

  translate(zeroX, zeroY);

  drawPoints();
  calculateScore();
}

void message(){
  String mess = "Right click to draw a line from green to red - ZERO is the goal"; //honestly, I don´t know if 0 in score is possible. but the point system turnd out to be difficult..
  String mess2 = "press ENTER to see your score";
  String messScore ="you got: " + score;

  if(showScore){
    fill(0);
    textSize(25);
    textAlign(CENTER, BOTTOM);
    text(messScore,  width/2, height/2);
  } else {
    fill(0);
    textSize(20);
    textAlign(CENTER, BOTTOM);
    text(mess, width/2, 40);
    textAlign(CENTER, TOP);
    text(mess2, width/2, 40);
  }
}

void drawMouse(){
  mousePressed();
}

void mousePressed(){
  int colorX = mouseX;
  int colorY = mouseY;
  if(mousePressed){
    stroke(colorX, colorY, 128);
    line(pmouseX, pmouseY, mouseX, mouseY);
    if(mouseX > zeroX || mouseX < (zeroX + vec1.x)){
      drawYValues[mouseX] = mouseY;
    }
    hasDrawn = true;
  }
}

void drawPoints(){
  stroke(0, 255, 0);
  strokeWeight(5);
  point(0,0);

  vec1.set(vecX, vecY);
  stroke(255, 0, 0);
  point(vec1.x, vec1.y);
}

void calculateScore(){
  if(firstItt){
    vectorAngle = degrees(atan(abs(vec1.y) / abs(vec1.x)));
    for(int i = 0; i < abs(vec1.x); i++){
      vecYValues[i] =  tan(vectorAngle) * i;
    }
    firstItt = false;
  }
  keyPressed();
}

void keyPressed(){
  if(hasDrawn){
    if(keyPressed == true && (keyCode == ENTER)){
      for(int i = 0; i < abs(vec1.x); i++){
        score += abs(drawYValues[zeroX + i] - vecYValues[i]);
        scoreDiv++;
      }
      score = score / scoreDiv;
      showScore = true;
    }
  }
}
