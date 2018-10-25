void keyPressed(){
  if(key == 'w' || key == 'W')
    pressedUp = true;

  if(key == 's' || key == 'S')
    pressedDown = true;

  if(key == 'a' || key == 'A')
    pressedLeft = true;

  if(key == 'd' || key == 'D')
    pressedRight = true;

  if(key == 'c' || key == 'C')
    pressedC = true;

  if(key == 'v' || key == 'V')
    pressedV = true;

  if(key == CODED){
    if(keyCode == UP)
      pressedUp = true;

    if(keyCode == DOWN)
      pressedDown = true;

    if(keyCode == LEFT)
      pressedLeft = true;

    if(keyCode == RIGHT)
      pressedRight = true;
  }
}

void keyReleased(){
  if(key == 'w' || key == 'W'){
    pressedUp = false;
    releasedUp = true;
  }
  if(key == 's' || key == 'S'){
    pressedDown = false;
    releasedDown = true;
  }
  if(key == 'a' || key == 'A')
    pressedLeft = false;

  if(key == 'd' || key == 'D')
    pressedRight = false;

  if(key == 'c' || key == 'C')
    pressedC = false;

  if(key == 'v' || key == 'V')
    pressedV = false;

  if(key == CODED){
    if(keyCode == UP)
      pressedUp = false;

    if(keyCode == DOWN)
      pressedDown = false;

    if(keyCode == LEFT)
      pressedLeft = false;

    if(keyCode == RIGHT)
      pressedRight = false;
  }
}

void mousePressed(){
  setMouseClicked(true);
}

boolean getMousePressed(){
  return mouseClicked;
}

void setMouseClicked(boolean a){
  mouseClicked = a;
}

boolean inputUp(){
  return pressedUp;
}

boolean inputRUp(){
  return releasedUp;
}

void setInputUp(boolean a){
  pressedUp = a;
}

void setInpuRUp(boolean a){
  releasedUp = a;
}

boolean inputDown(){
  return pressedDown;
}

boolean inputRDown(){
  return releasedDown;
}

void setInputDown(boolean a){
  pressedDown = a;
}

void setInputRDown(boolean a){
  releasedDown = a;
}

boolean inputLeft(){
  return pressedLeft;
}

boolean inputRight(){
  return pressedRight;
}

boolean inputC(){
  return pressedC;
}

boolean inputV(){
  return pressedV;
}

boolean inputClick(){
  return mouseClicked;
}
