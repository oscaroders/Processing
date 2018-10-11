boolean up, down, space, mouse;

void keyPressed(){
  if(key == CODED){
    if(keyCode == UP)
      up = true;
    if(keyCode == DOWN)
      down = true;
  }
  if(key == ' ')
    space = !space;
}

void keyReleased(){
  if(key == CODED){
    if(keyCode == UP)
      up = false;
    if(keyCode == DOWN)
      down = false;
  }
}

void mousePressed(){
  mouse = true;
}

void mouseReleased(){
  mouse = false;
}

boolean mousePr(){
  return mouse;
}

boolean pressedUp(){
  return up;
}

boolean pressedDown(){
  return down;
}
