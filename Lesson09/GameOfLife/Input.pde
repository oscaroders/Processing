boolean up, down, space, mouse;
int zoom;

void keyPressed(){
    if(key == CODED){
        if(keyCode == UP)
            up = true;
        if(keyCode == DOWN)
            down = true;
    }
    if(key == ' ')
        space = !space;
    if(key == '+')
        zoom++;
    if(key == '-')
        zoom--;
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

int zoomValue(){
    zoom = constrain(zoom, 1, 5);
    return zoom;
}
