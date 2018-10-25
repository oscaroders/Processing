public class Player extends Object{

  // Constructors --------------------------------------------------------------
  public Player(float x, float y){
    super(x, y);
  }

  public Player(float x, float y, float size){
    super(x, y, size);
  }

  // Functions -----------------------------------------------------------------
  void setup(){
    bullets = new Bullet[maxNumberOfBullets];
  }

  void update(){
    fire();
    setDirection();
    bounderies();
    positionUpdate();
  }

  void draw(){
    pushMatrix();
      translate(position.x, position.y);
      alphaAngle = atan2(direction.y, direction.x);
      rotate(PI * 2 + alphaAngle);
      fill(0, 255, 00);
      rectMode(CENTER);
      pushMatrix();
        rotate(PI / 2);
        imageMode(CENTER);
        image(mainSpaceShip, 0, 0, 60, 90);
      popMatrix();
      //rect(0, 0 , size, size);
      //line(0, 0, direction.x *20 ,direction.y*20);
    popMatrix();
  }

  void fire(){
    if (getMousePressed()){
      addBullet((position.x + cos(alphaAngle + radians(40)) * 35), (position.y + sin(alphaAngle + radians(40)) * 35), 10, direction);
      addBullet((position.x + cos(alphaAngle - radians(40)) * 35), (position.y + sin(alphaAngle - radians(40)) * 35), 10, direction);
      setMouseClicked(false);
    }
  }

  void setDirection(){
    direction.set(mouseX - position.x, mouseY - position.y);
    direction.normalize();
  }

  void bounderies(){
    if(position.x < 0 + size / 2){
      position.x = size / 2;
    }
    if(position.x > width - size / 2){
      position.x = width - size / 2;
    }
    if(position.y < 0 + size / 2){
      position.y = size / 2;
    }
    if(position.y > height - size / 2){
      position.y = height - size / 2;
    }
  }

  void positionUpdate(){
    float tempx = position.x;
    float tempy = position.y;
    betaAngle = 182 + degrees(alphaAngle);
    if(inputUp()){
      position.y += direction.y * speed(); //velocity!!
      position.x += direction.x * speed();
      tempSpeed = speed();
    } else if(inputRUp()){
      position.y += direction.y * tempSpeed;
      position.x += direction.x * tempSpeed;
      tempSpeed -= tempSpeed / 10;
      if(tempSpeed < 0.2 || (inputUp() || inputDown())){
        setInpuRUp(false);
      }
    }
    if(inputDown()){
      position.y -= direction.y * speed();
      position.x -= direction.x * speed();
      tempSpeed = speed();
    } else if(inputRDown()){
      position.y -= direction.y * tempSpeed;
      position.x -= direction.x * tempSpeed;
      tempSpeed -= tempSpeed / 10;
      if(tempSpeed < 0.2 || (inputUp() || inputDown())){
        setInputRDown(false);
      }
    }
    if(inputLeft() || inputRight()){
      if(inputLeft()){
        if(betaAngle < 180){
          betaAngle += 6;
          tempx = mouseX + cos(radians(betaAngle)) * dist(position.x, position.y, mouseX, mouseY);
          tempy = mouseY + sin(radians(betaAngle)) * dist(position.x, position.y, mouseX, mouseY);
        } else {
          betaAngle = betaAngle - 10;
          tempx = mouseX + cos(radians(betaAngle)) * dist(position.x, position.y, mouseX, mouseY);
          tempy = mouseY + sin(radians(betaAngle)) * dist(position.x, position.y, mouseX, mouseY);
        }
      }
      if(inputRight()){
        if(betaAngle < 180){
          betaAngle = betaAngle - 10;
          tempx = mouseX + cos(radians(betaAngle)) * dist(position.x, position.y, mouseX, mouseY);
          tempy = mouseY + sin(radians(betaAngle)) * dist(position.x, position.y, mouseX, mouseY);
        }else{
          betaAngle += 6;
          tempx = mouseX + cos(radians(betaAngle)) * dist(position.x, position.y, mouseX, mouseY);
          tempy = mouseY + sin(radians(betaAngle)) * dist(position.x, position.y, mouseX, mouseY);
        }
      }
      position.x = tempx;
      position.y = tempy;
    }
  }

  float speed(){
    if(speed <= 0.9)
      speed = 1;
    if(speed > 10)
      speed = 10;
    if(inputC())
      speed += 0.1;
    if(inputV())
      speed -= 0.5;
    return speed;
  }
}
