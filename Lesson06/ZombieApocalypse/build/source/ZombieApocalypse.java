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

CharacterManager ralf;

public void setup(){
  
  ralf = new CharacterManager(99);
  ralf.spawn();
}

public void draw(){
  int currentTime = millis();
  tpf = (currentTime - time) * 0.001f;
  background(255);

  ralf.update();

  time = currentTime;
}
class CharacterManager{

  int numberOfCharacters;
  Human[] humans;

  public CharacterManager(int numberOfCharacters){
    this.numberOfCharacters = numberOfCharacters;
  }

  public void spawn(){
    humans = new Human[numberOfCharacters];
    for(int i = 0; i < numberOfCharacters; i++){
      humans[i] = new Human();
    }
    // Zombie zombie = new Zombie();
    // zombie = humans[0];
  }

  public void update(){
    for(int i = 0; i < numberOfCharacters; i++){
      print("update");
      humans[i].update();
    }
  }
}
class Human{

  PVector position;
  PVector velocity;
  float size;
  int c = color(255, 160, 122);

  public Human(){
    position = new PVector();
    position.x = random(0, width);
    position.y = random(0, height);

    velocity = new PVector();
    velocity.x = random(3, 5) * random(-1, 1);
    velocity.y = random(3, 5) * random(-1, 1);

    size = random(9, 12);
  }

  public void update(){
    position.x += velocity.x;
    position.y += velocity.y;
    
    draw();
  }

  public void draw(){


    fill(c);
    noStroke();
    rect(position.x, position.y, size, size);
  }
}
class Zombie extends Human{

  int c = color(102, 205, 170);

  public Zombie(){
    super();
  }

  public void update(){
    position.x += velocity.x * 0.5f;
    position.y += velocity.y * 0.5f;

    draw();
  }

  public void draw(){
    
    fill(c);
    noStroke();
    rect(position.x, position.y, size, size);
  }

}
  public void settings() {  size(500,500); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "ZombieApocalypse" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
