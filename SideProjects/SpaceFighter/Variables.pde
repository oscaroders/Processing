Player player1;
Player player2;
Bullet[] bullets;
Enemy[] enemy;

PImage mainSpaceShip;

boolean firstItt;
boolean pressedUp, pressedDown, pressedLeft, pressedRight, mouseClicked,
        pressedC, pressedV, releasedUp, releasedDown;
float alphaAngle, betaAngle, tempSpeed;
int backgcount, bulletArrayCounter, evadeCounter;
int maxNumberOfBullets = 100, numberOfEnemies = 10, numberOfStars = 500;
PVector[] starPos;

// Colors ----------------------------------------------------------------------
color yellow = color(255, 255, 102);
color lightYellow = color(255, 255, 204);
color spaceBlue = color(12, 36, 39);
