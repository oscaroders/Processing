GameManager gameManager;

void setup(){
      //size(500, 500);
      fullScreen();
      gameManager = new GameManager();
      gameManager.setup();
}

void draw(){
      gameManager.update();
      gameManager.draw();

      pushMatrix();
          translate(100,100);
          rotate(radians(0));
          rectMode(CENTER);
          rect(0, 0, 20, 20);
      popMatrix();

      line(100,10,100,190);

      if(firstItt)
          firstItt = false;
}
