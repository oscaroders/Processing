public class Bullet extends Object{

  boolean justSpawned;
  float directionX, directionY;

  // Constructors --------------------------------------------------------------
  public Bullet(float x, float y){
    super(x, y);
    speed = 5;
    justSpawned = true;
  }

  public Bullet(float x, float y, float size){
    super(x, y, size);
    speed = 30;
    justSpawned = true;
  }

  // Functions -----------------------------------------------------------------
  void update(){
    position.set(position.x + directionX * speed,
                 position.y + directionY * speed);
  }

  void draw(){
    if(!(directionX == 0 && directionY == 0)){
      noStroke();
      fill(255, 0, 0);
      ellipseMode(CENTER);
      ellipse(position.x, position.y, size / 2, size / 2);
      stroke(yellow);
    }
  }

  void setBulletDirection(PVector direction){
		if(justSpawned){
			directionX += direction.x;
			directionY += direction.y;
			justSpawned = false;
		}
	}
}
