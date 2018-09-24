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

public class ZombieApocalypse extends PApplet {

float tpf;
float time;
int endTime;
int currentTime;

CharacterManager ralf;

public void setup(){
  
  endTime = 0;
  ralf = new CharacterManager(99);
  ralf.spawn();
}

public void draw(){
  currentTime = millis();
  tpf = (currentTime - time) * 0.001f;
  background(210);

  ralf.update();

  gameOver();

  time = currentTime;
}
public class Character{

  PVector position;
  PVector velocity;
  float size;
  int c = color(0);
  float maxSpeed = 3;
  float minSpeed = 1;

  public Character(){
    position = new PVector();
    position.x = random(0, width);
    position.y = random(0, height);

    velocity = new PVector();
    velocity.x = random(minSpeed,  maxSpeed) * random(-1, 1);
    velocity.y = random(minSpeed,  maxSpeed) * random(-1, 1);

    size = random(20, 25);
  }

  public Character(float x, float y){
    position = new PVector(x, y);

    velocity = new PVector();
    velocity.x = random(minSpeed,  maxSpeed) * random(-1, 1);
    velocity.y = random(minSpeed,  maxSpeed) * random(-1, 1);

    size = random(20, 25);
  } 

  public void update(){
    bounderies();
    timeToTurn();

    position.x += velocity.x;
    position.y += velocity.y;


    draw();
  }

  public void draw(){
    fill(c);
    noStroke();
    rect(position.x, position.y, size, size);
  }

  public void bounderies(){
    if(position.x < 0)
      position.x = height;

    if(position.x > height)
      position.x = 0;

    if(position.y < 0)
      position.y = width;

    if(position.y > width)
      position.y = 0;
  }

  public void timeToTurn(){
    int counter = millis();
    if(counter % 100 == (int)random(0,10)){
      velocity.y = random(minSpeed,  maxSpeed);
    } else if(counter % 100 == (int)random(20,30)){
      velocity.y = random(minSpeed,  maxSpeed) * -1;
    } else if(counter % 100 == (int)random(50,60)){
      velocity.x = random(minSpeed,  maxSpeed);
    } else if(counter % 100 == (int)random(70,80)){
      velocity.x = random(minSpeed,  maxSpeed) * -1;
    }
  }

  public boolean isHuman(){
    return true;
  }
}
class CharacterManager{

  int numberOfCharacters;
  Character[] characters;
  Zombie zombie;

  public CharacterManager(int numberOfCharacters){
    this.numberOfCharacters = numberOfCharacters;
  }

  public void spawn(){
    characters = new Character[numberOfCharacters];
    for(int i = 0; i < numberOfCharacters - 1; i++){
      characters[i] = new Human();
    }
    zombie = new Zombie();
    characters[numberOfCharacters - 1] = zombie;
  }

  public void update(){
    collision();

    for(int i = 0; i < numberOfCharacters; i++){
      characters[i].update();
    }
  }

  public void collision(){
    Zombie bittenZombie;
    for(int i = 0; i < numberOfCharacters; i++){
      if(!characters[i].isHuman()){
        for(int j = 0; j < numberOfCharacters; j++){
          if(characters[j].isHuman() &&
             hasCollided(characters[i].position.x,
                         characters[i].position.y,
                         characters[i].size,

                         characters[j].position.x,
                         characters[j].position.y,
                         characters[j].size) ) {
            bittenZombie = new Zombie(characters[j].position.x,
                                      characters[j].position.y);
            characters[j] = bittenZombie;
          }
        }
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

  public boolean areAllDead(){
    int numberOfHumans = 0;
    for(int i = 0; i < numberOfCharacters; i++){
      if(characters[i].isHuman()){
        numberOfHumans++;
      }
    }
    if(numberOfHumans == 0){
      return true;
    } else {
      return false;
    }
  }
}
class Human extends Character{

  int c;

  public Human(){
    super();

    switch((int)random(1, 5.99f)){
          case 1:  c = color(255, 160, 122);
          break;
          case 2:  c = color(210, 180, 140);
          break;
          case 3:  c = color(255, 240, 245);
          break;
          case 4:  c = color(139, 69, 19);
          break;
          case 5:  c = color(255, 250, 205);
          break;
    }
  }

  public void draw(){
    fill(c);
    noStroke();
    rect(position.x, position.y, size, size);
    fill(255);
    ellipse(position.x + (size * 0.25f), position.y + (size * 0.5f) , size * 0.5f, size * 0.5f);
    ellipse(position.x + (size * 0.75f), position.y + (size * 0.5f) , size * 0.5f, size * 0.5f);
    fill(0);
    ellipse(position.x + (size * 0.5f) - 3, position.y + (size * 0.5f), 4, 4);
    ellipse(position.x + (size * 0.5f) + 3, position.y + (size * 0.5f), 4, random(4, 6));
  }
}
class Zombie extends Character{

  PVector direction;
  int c = color(102, 205, 170);

  public Zombie(){
    super();
    direction = new PVector();
  }

  public Zombie(float x, float y){
    super(x, y);
    direction = new PVector();
  }

  public void update(){
    bounderies();
    PVector closestHuman = new PVector();
    closestHuman = whoIsClose(super.position);

    direction.set(closestHuman.x - position.x,
                  closestHuman.y - position.y);
    direction.normalize();
    position.add(direction);

    draw();
  }

  public void draw(){

    fill(c);
    noStroke();
    ellipse(position.x, position.y, size, size);
    stroke(102, 225, 180);
    strokeWeight(3);
    line(position.x + size * 0.4f,
         position.y,
         position.x + direction.x * size * 0.75f + size * 0.4f,
         position.y + direction.y * size * 0.75f);

    line(position.x - size * 0.4f,
         position.y,
         position.x + direction.x * size * 0.75f - size * 0.4f,
         position.y + direction.y * size * 0.75f);
  }

  public boolean isHuman(){
    return false;
  }
}
public PVector whoIsClose(PVector position){

  PVector closestHuman = new PVector();
  PVector closest;
  float closestF = 1000;
  float tempDist;
  closest = new PVector(0, 0);

  for(int i = 0; i < ralf.numberOfCharacters ; i++){
    if(ralf.characters[i].isHuman()){

      if((ralf.characters[i].position.x < position.x + 300 &&
         ralf.characters[i].position.x > position.x - 300) &&
        (ralf.characters[i].position.y < position.y + 300 &&
         ralf.characters[i].position.y > position.y - 300)){

         tempDist = dist(ralf.characters[i].position.x,
                         ralf.characters[i].position.y,
                         position.x,
                         position.y);

         if(tempDist < closestF){
           closestF = tempDist;
           closest.set(ralf.characters[i].position.x, ralf.characters[i].position.y) ;

        }
      }
    }
  }
  return closestHuman.set(closest.x ,closest.y);
}

public void gameOver(){
  PFont bloodFont;
  bloodFont = createFont("bloodFont.otf", 76);
  textFont(bloodFont);
  fill(178, 34, 34);
  textAlign(CENTER, TOP);
  if(ralf.areAllDead()){
    if(endTime == 0)
      endTime = round(currentTime * 0.001f);

    text("game over", width / 2, 200);
    text("the virus took over\nin " + endTime + " seconds", width / 2, 320);
  }
}
  public void settings() {  size(1000, 1000); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "ZombieApocalypse" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
