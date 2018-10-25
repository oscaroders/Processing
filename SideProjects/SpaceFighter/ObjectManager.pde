void initialObjectSetup(){
  // Create Players ----------------------------------------------------------
  if(singlePlayerGame()){
    player1 = new Player(width * 0.5, height * 0.5);
    player1.setup();
  }
  if(multiPlayerGame()){
    player1 = new Player(width * 0.33, height * 0.5);
    player2 = new Player(width * 0.66, height * 0.5);
    player1.setup();
    player2.setup();
  }

  // Create Enemies ----------------------------------------------------------
  enemy = new Enemy[numberOfEnemies];
  for(int i = 0; i < numberOfEnemies; i++){
    enemy[i] = new Enemy();
  }

  //create BulletArrays ------------------------------------------------------
  bullets = new Bullet[maxNumberOfBullets];

  // Create Astroids ---------------------------------------------------------
}

void objectUpdate(){
  // Update Players ----------------------------------------------------------
  player1.update();
  if(multiPlayerGame()){
    player1.update();
    player2.update();
  }

  // Update Enemies ----------------------------------------------------------

  // Update Bullets ----------------------------------------------------------
  for(int i = 0; i < maxNumberOfBullets; i++){
    if(bullets[i] instanceof Bullet)
      bullets[i].update();
  }

  // Update Astroids -------------------------------------------------------
}

void objectDraw(){
  // Draw Bullets ------------------------------------------------------------
  for(int i = 0; i < maxNumberOfBullets; i++){
    if(bullets[i] instanceof Bullet)
     bullets[i].draw();
  }

  // Draw PLayers ------------------------------------------------------------
  player1.draw();
  if(multiPlayerGame()){
    player1.draw();
    player2.draw();
  }

  // Draw Enemies ------------------------------------------------------------



  // Draw Astoids ------------------------------------------------------------

}

// Handels Players -----------------------------------------------------------


// Handels Enemies -----------------------------------------------------------


// Handels Bullets -----------------------------------------------------------
void addBullet(float x, float y, float size, PVector direction){
  bullets[bulletArrayCounter] = new Bullet(x, y, size);
  bullets[bulletArrayCounter].setBulletDirection(direction);
  bulletArrayCounter++;
  if(bulletArrayCounter == maxNumberOfBullets)
      bulletArrayCounter = 0;
}

// Handels Asteroids ---------------------------------------------------------
