boolean up, down;

void keyPressed(){
  if(key == CODED){
    if(keyCode == UP)
      up = true;
    if(keyCode == DOWN)
      down = true;
  }
}

void keyReleased(){
  if(key == CODED){
    if(keyCode == UP)
      up = false;
    if(keyCode == DOWN)
      down = false;
  }
}

boolean pressedUp(){
  return up;
}

boolean pressedDown(){
  return down;
}
