import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class SpaceDot extends PApplet {

float tpf, time;
int currentTime, backgcount, endTime;

boolean firstItt, gameOver;
PVector[] starPos;
int numberOfStars, numberOfMissiles;

ObjectManager paul;

public void setup(){
  
  firstItt = true;
  gameOver = false;
  endTime = 0;
  backgcount = 0;
  numberOfStars = 500;
  starPos = new PVector[numberOfStars];
  paul = new ObjectManager();
  paul.spawnDot("Steve");
  numberOfMissiles = 60;
  paul.spawnMissile(numberOfMissiles);
}

public void draw(){
  currentTime = millis();
  tpf = (currentTime - time) * 0.001f;
  drawBackground();

  paul.update();
  displayScore();
  gameOver();

  if(firstItt){
    firstItt = false;
  }
  time = currentTime;
}
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

  public void update(){
    move.set((mouseX - position.x) * tpf, (mouseY - position.y) * tpf);
    move.normalize();
    position.add(move);

    draw();
  }

  public void draw(){
    noStroke();
    fill(spaceDotPurple);
    ellipse(position.x ,position.y, size, size);
  }

  public void incScore(){
    score++;
  }
}
class Missile{

  PVector position;
  int side;
  int size;
  float speed;
  float maxOffset = height;

  public Missile(int side){
    this.side = side;
    if(this.side == 1)
      position = new PVector(random(-maxOffset, 0), random(10, height - 10));
    if(this.side == 2)
      position = new PVector(random(10, width - 10), random(-maxOffset, 0));
    if(this.side == 3)
      position = new PVector(random(width + maxOffset), random(10, height - 10));
    if(this.side == 4)
      position = new PVector(random(10, width - 10), random(height + maxOffset));
    if(this.side > 4)
      position = new PVector(0, height / 2);

    size = 15;
    speed = 100;
  }

  public void update(){
    if(this.side == 1)
      position.set(position.x + speed * tpf, position.y);
    if(this.side == 2)
      position.set(position.x, position.y + speed * tpf);
    if(this.side == 3)
      position.set(position.x - speed * tpf, position.y);
    if(this.side == 4)
      position.set(position.x, position.y - speed * tpf);
    if(this.side > 4)
      position.set(position.x, position.y + speed * tpf);

    bounduries();
    draw();
  }

  public void draw(){
    fill(0);
    if(side == 1 || side == 3){
      rect(position.x, position.y, size * 2, size);
    } else if(side == 2 || side == 4){
      rect(position.x, position.y, size, size * 2);
    } else {
      rect(position.x, position.y, size, size * 2);
    }
  }

  public void bounduries(){
    if(position.x > width)
      position.set(0, position.y);
    if(position.x < 0)
      position.set(width, position.y);
    if(position.y > height)
      position.set(position.x, 0);
    if(position.x < 0)
      position.set(position.x, height);
  }

}
class ObjectManager{

  SpaceFruit apple;
  Missile[] missy;
  Dot dot;


  public ObjectManager(){

  }

  public void spawnFruit(){
    apple = new SpaceFruit();
  }

  public void spawnMissile(int numberOfMissiles){
    missy = new Missile[numberOfMissiles];
      for(int i = 0; i < numberOfMissiles; i++){
        missy[i] = new Missile((int)random(1, 5));
      }
  }

  public void spawnDot(String name){
    dot = new Dot(name);
  }

  public void update(){
    if(firstItt || hasEaten(dot.position.x,
                            dot.position.y,
                            dot.size,

                            apple.position.x,
                            apple.position.y,
                            apple.size)){
      spawnFruit();

    }


    apple.draw();
    dot.update();
    eatFruit();
    shootMissile();
    collision();
  }

  public void eatFruit(){
    if(hasEaten(dot.position.x,
                dot.position.y,
                dot.size,

                apple.position.x,
                apple.position.y,
                apple.size)){
      dot.incScore();
    }
  }

  public boolean hasEaten(float x1, float y1, float size1, float x2, float y2, float size2){
    return hasCollided(x1, y1, size1, x2, y2, size2);
  }

  public void shootMissile(){
    for(int i = 0; i < numberOfMissiles; i++){
      missy[i].update();
    }
  }

  public void collision(){
    for(int i = 0; i < numberOfMissiles; i++){
      if(hasCollided(dot.position.x,
                     dot.position.y,
                     dot.size,

                     missy[i].position.x,
                     missy[i].position.y,
                     missy[i].size)){
        gameOver = true;
      }
    }
  }

  public boolean hasCollided(float x1, float y1, float size1, float x2, float y2, float size2){
    float maxDistance = size1 / 2 + size2 / 2;

    if(abs(x1 - x2) > maxDistance || abs(y1 - y2) > maxDistance){
      return false;
    } else if(dist(x1, y1, x2, y2) > maxDistance) {
      return false;
    } else {
      return true;
    }
  }
}
class SpaceFruit{
  PVector position;
  float size;

  public SpaceFruit(){
    position = new PVector(random(10, width - 10),
                           random(10, height - 10));
    size = 10;
  }

  public void draw(){
    noStroke();
    fill(spaceAppleRed);
    ellipse(position.x, position.y, size, size);
  }
}
int yellow = color(255, 255, 102);
int lightYellow = color(255, 255, 204);
int spaceBlue = color(12, 36, 39);
int spaceDotPurple = color(102, 0, 102);
int spaceAppleRed = color(255, 77, 77);
int scoreTextGreen = color(0, 102, 0);
public void drawBackground(){
  background(spaceBlue);

  if(firstItt){
    generateBackground();
  }

  for(int i = 0; i < numberOfStars; i++){
    if(backgcount % (int)random(7, 23) == 0){
      stroke(lightYellow);
      strokeWeight(random(2, 5));
    } else {
      stroke(yellow);
      strokeWeight(2);
    }
    point(starPos[i].x, starPos[i].y);
    backgcount++;
  }
}

public void generateBackground(){
  for(int i = 0; i < numberOfStars; i++){
    starPos[i] = new PVector(random(0, width),
                             random(0, height));
  }
}

public void displayScore(){
  textAlign(CENTER,TOP);
  textSize(40);
  fill(scoreTextGreen);
  text("score: " + paul.dot.score, width / 2, 10);
}

public void gameOver(){
  fill(255);
  textAlign(CENTER, TOP);
  if(gameOver){
    if(endTime == 0)
      endTime = round(currentTime * 0.001f);
    text("game over", width / 2, 200);
    text("You survived the cold space \nin " + endTime + " seconds", width / 2, 320);
  }
}
  public void settings() {  size(1900, 1000); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "SpaceDot" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
