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

public class CircleIntersection extends PApplet {

private float _dt, _lt;
public ArrayList<Shape> shapes;

public Circle circ1, circ2;
public Box box1, box2;
public Line line1, line2;
public MultiBox player;

public void setup(){
  

  shapes = new ArrayList<Shape>();

  circ1 = new Circle(300, 200, 50);
  circ2 = new Circle(325, 225, 50);

  box1 = new Box(400, 200, 60, 40);
  box2 = new Box(430, 220, 60, 40);

  line1 = new Line(10, 10, width - 10, height - 10);
  line2 = new Line(width - 10, 10, 10, height - 10);

  player = new MultiBox(400, 1, 40, 80);

  shapes.add(circ1);
  shapes.add(circ2);

  shapes.add(box1);
  shapes.add(box2);

  shapes.add(line1);
  shapes.add(line2);

  shapes.add(player);
}

public void draw(){
  tickDeltaTime();
  background(255);

  for(int i = 0; i < shapes.size(); i++){
    shapes.get(i).update(_dt);
    if(shapes.get(i).isBox()){
      player.fall((Box)shapes.get(i));
    }

  }

  if(line1.intersectsLine(line2)){
    fill(255, 0, 0);
    ellipse(line1.intersX, line1.intersY, 5, 5);
    fill(255);
  }

  //println(circ1.intersectsCircle(circ2));
  //println(box1.intersectsBox(box2));
  //println(line1.intersectsLine(line2));
  //println("onGround: " + player.onGround(box1));
  //println("inGround: " + player.inGround(box1));
}

public void tickDeltaTime(){
  _dt = (millis() - _lt) * 0.001f;
  _lt = millis();
}
public class Box extends Shape{
  public PVector size;

  public Box(float x, float y, float w, float h){
    super(x, y);

    size = new PVector(w, h);
  }

  public void update(float dt){
    super.update(dt);
    draw();
  }

  public void draw(){
    rectMode(CENTER);
    rect(pos.x, pos.y, size.x, size.y);
  }

  public boolean intersectsBox(Box other){
    return !(
      other.minX() > maxX() ||
      other.maxX() < minX() ||
      other.maxY() < minY() ||
      other.minY() > maxY()
    );
  }

  public float maxX(){
    return pos.x + size.x * 0.5f;
  }

  public float maxY(){
    return pos.y + size.y * 0.5f;
  }

  public float minX(){
    return pos.x - size.x * 0.5f;
  }

  public float minY(){
    return pos.y - size.y * 0.5f;
  }

  public boolean isBox(){
    return true;
  }

  public void set(float x, float y, float w, float h){
    pos.x = x;
    pos.y = y;
    size.x = w;
    size.y = h;
  }
}
public class Circle extends Shape{
  public float r;

  public Circle(float x, float y, float d){
    super(x, y);

    this.r = d * 0.5f;
  }

  public void update(float dt){
    super.update(dt);
    draw();
  }

  public void draw(){
    ellipse(pos.x, pos.y, r * 2, r * 2);
  }

  public boolean intersectsCircle(Circle other){
    return dist(pos.x, pos.y, other.pos.x, other.pos.y) < r + other.r;
  }

  public boolean isCircle(){
    return true;
  }

}
//Repetition av OOP
//  public, private, protected
//  class, interface
//  extends, implements
//  static, abstract, final

//Array och ArrayList<>

//Kollision
//  Real world, molecules push objects away 
//    from each other

//  Very basic geometry
//    Circle: radius
//    Rectangle: intersection of bounds
//    Line: intersection of lines
//    Line/Plane: intersection of line and plane

//  Vertice based geometry
//    Intersection of edges
//    3D Concave/Convex issue

//  Pixel collision
//    Per pixel check, Bitmap
//    Height Maps
//    Collision boxes

//  Optimization required
//    Bounding boxes, Quadtrees, Octrees

//1.Koda om linjekollisionen så att den returnerar positionen där de korsar varandra
//   http://processingjs.org/learning/custom/intersect/
//2.Förse multikollisionen objektet med rörelse och gravitation
//3.Låt in-kollision leda till att positionen korrigeras så att multikollisionsobjektet alltid
//    hamnar ovanpå "plattformarna" och fall stängs av
//4.Implementera att avsaknad av on-kollision leder till att multikollision börjar falla igen
//*5.Implementera möjlighet för multikollisionsobjetet att gå höger och vänster och "hoppa"
//*6.Implementera att kollision mellan multikollisionsobjektet och cirklar tar bort cirklarna
boolean moveLeft;
boolean moveRight;

public void keyPressed(){
  if(key == CODED){
    if(keyCode == RIGHT){
      moveRight = true;
    }
    if(keyCode == LEFT){
      moveLeft = true;
    }
  }
  if(key == 'd' || key == 'D'){
    moveRight = true;
  }
  if(key == 'a' || key == 'A'){
    moveLeft = true;
  }
}

public void keyReleased(){
  if(key == CODED){
    if(keyCode == RIGHT){
      moveRight = false;
    }
    if(keyCode == LEFT){
      moveLeft = false;
    }
  }
  if(key == 'd' || key == 'D'){
    moveRight = false;
  }
  if(key == 'a' || key == 'A'){
    moveLeft = false;
  }
}

public float getAxisRaw(String axis){
  if(axis == "Horizontal"){
    if(moveLeft){
      return -1;
    }
    if(moveRight){
      return 1;
    }
  }

  return 0;
}
//http://processingjs.org/learning/custom/intersect/
public class Line extends Shape{
  public PVector dest;
  float intersX, intersY;

  public Line(float x, float y, float x2, float y2){
    super(x, y);

    dest = new PVector(x2, y2);
  }

  public void update(float dt){
    super.update(dt);
    draw();
  }

  public void draw(){
    line(pos.x, pos.y, dest.x, dest.y);
  }

  public boolean intersectsLine(Line other){

    //Compute own lines in standard form a, b, c
    float a1 = dest.y - pos.y;
    float b1 = pos.x - dest.x;
    float c1 = (dest.x * pos.y) - (pos.x * dest.y);

    //Compute r3 and r4.
    float r3 = ((a1 * other.pos.x) + (b1 * other.pos.y) + c1);
    float r4 = ((a1 * other.dest.x) + (b1 * other.dest.y) + c1);

    //Check if r3 and r4 both lie on same side of second line segment
    if ((r3 != 0) && (r4 != 0) && sameSign(r3, r4)){
      return false;
    }

    //Compute other lines a, b, c
    float a2 = other.dest.y - other.pos.y;
    float b2 = other.pos.x - other.dest.x;
    float c2 = (other.dest.x * other.pos.y) - (other.pos.x * other.dest.y);

    //Compute r1 and r2
    float r1 = ((a2 * pos.x) + (b2 * pos.y) + c2);
    float r2 = ((a2 * dest.x) + (b2 * dest.y) + c2);

    //Check if r1 and r2 both lie on same side of second line segment
    if ((r1 != 0) && (r2 != 0) && (sameSign(r1, r2))){
      return false;
    }

    //Denominator is 0, collinear och parallel
    if ((a1 * b2) - (a2 * b1) == 0) {
      return false;
    }

    float denom, offset, num;
    //Line segments intersect: compute intersection point.
     denom = (a1 * b2) - (a2 * b1);

     if (denom == 0) {
       return false;
     }

     if (denom < 0){
       offset = -denom / 2;
     }
     else {
       offset = denom / 2 ;
     }

     num = (b1 * c2) - (b2 * c1);
     if (num < 0){
       intersX = (num - offset) / denom;
     }
     else {
       intersX = (num + offset) / denom;
     }

     num = (a2 * c1) - (a1 * c2);
     if (num < 0){
       intersY = ( num - offset) / denom;
     }
     else {
       intersY = (num + offset) / denom;
     }

    //If at this point, do intersect
    return true;
  }

  //Help function for checking if a and b have same sign
  public boolean sameSign(float a, float b){
    return ((a * b) >= 0);
  }

  public boolean isLine(){
    return true;
  }
}
public class MultiBox extends Shape{
  public Box center;
  public Box inLeft, inRight, inTop, inBot;
  public Box onLeft, onRight, onTop, onBot;

  float velocityY = 160, velocityX = 0, acceleration = 5;
  PVector velocity;
  float w, h, xSpeed = 5;

  public MultiBox(float x, float y, float w, float h){
    super(x, y);

    velocity = new PVector(velocityX, velocityY);

    this.w = w;
    this.h = h;

    center = new Box(x, y, w, h);

    inLeft = new Box(x - w * 0.5f + 2, y, 2, 10);
    inRight = new Box(x + w * 0.5f - 2, y, 2, 10);
    inTop = new Box(x, y - h * 0.5f + 2, 10, 2);
    inBot = new Box(x, y + h * 0.5f - 2, 10, 2);

    onLeft = new Box(x - w * 0.5f - 1, y, 2, 10);
    onRight = new Box(x + w * 0.5f + 1, y, 2, 10);
    onTop = new Box(x, y - h * 0.5f - 1, 10, 2);
    onBot = new Box(x, y + h * 0.5f + 1, 10, 2);
  }

  public void update(float dt){
    super.update(dt);

    center.set(pos.x, pos.y, w, h);

    inLeft.set(pos.x - w * 0.5f + 2, pos.y, 2, 10);
    inRight.set(pos.x + w * 0.5f - 2, pos.y, 2, 10);
    inTop.set(pos.x, pos.y - h * 0.5f + 2, 10, 2);
    inBot.set(pos.x, pos.y + h * 0.5f - 2, 10, 2);

    onLeft.set(pos.x - w * 0.5f - 1, pos.y, 2, 10);
    onRight.set(pos.x + w * 0.5f + 1, pos.y, 2, 10);
    onTop.set(pos.x, pos.y - h * 0.5f - 1, 10, 2);
    onBot.set(pos.x, pos.y + h * 0.5f + 1, 10, 2);

    movment();
    jump();
    draw();
  }

  public void draw(){
    rectMode(CENTER);
    rect(pos.x, pos.y, center.size.x, center.size.y);
  }

  public boolean inGround(Box other){
    return inBot.intersectsBox(other);
  }

  public boolean onGround(Box other){
    return onBot.intersectsBox(other);
  }

  public void fall(Box other){
    if(!(onBot.intersectsBox(other))){
      velocity.set(velocity.x, velocity.y + acceleration);
      pos.y += velocity.y * _dt;
      pos.x += velocity.x * _dt;
    } else {
      pos.y = pos.y;
      pos.x = pos.x;
    }
  }

  public void jump(){

  }

  public void movment(){
    float xMovment = getAxisRaw("Horizontal") * xSpeed;
    pos.x += xMovment;
  }
}
public abstract class Shape{
  public PVector pos;

  public Shape(float x, float y){
    pos = new PVector(x, y);
  }

  public void update(float dt){
  }

  public boolean isBox(){
    return false;
  }

  public boolean isCircle(){
    return false;
  }

  public boolean isLine(){
    return false;
  }
}
  public void settings() {  size(640, 480); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "CircleIntersection" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
