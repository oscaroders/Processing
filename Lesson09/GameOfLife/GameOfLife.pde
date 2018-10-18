GameObject[][] cells;
int[][] neighbours;
int numberOfColumns, numberOfRows, tempNeighbourCount, generations, steadyAt, currentTime;
int activeCells = 0, numberOfPrevActiveCells = 0;
int fillPercentage = 10;
float dt, time;
float cellSize = 4;
boolean steady;

void setup(){
    size(1000, 500);
    frameRate(60);
    gameSetup();
}


void draw(){
    currentTime = millis();
    dt = (currentTime - time) * 0.001f;

    if(!space){
        clickInCell();
        drawCells();

    } else {
        pushMatrix();
            noStroke();
            zoomControl();
            checkBoard();
            updateCells();
            drawCells();
            printSteadyState();
            generations++;
            printGenerations();
        popMatrix();
    }

    time = currentTime;
}


void zoomControl(){
    float widthPresentage = mouseX / (float)width;
    float heightPresentage = mouseY / (float)height;
    float zoomX = width * zoomValue();
    float zoomY = height * zoomValue();

    translate(width * widthPresentage - zoomX * widthPresentage, height * heightPresentage - zoomY * heightPresentage);
    scale(zoomValue());
}


void clickInCell(){
    stroke(0);
    int posX = (int)(mouseX / cellSize);
    int posY = (int)(mouseY / cellSize);

    if(!(mouseY < 0 || mouseX < 0 || mouseY > height || mouseX > width)){
        if(mousePr() && cells[posX][(int)(mouseY / cellSize)].alive == false){
            cells[posX][posY].alive = true;

        } else if(mousePr() && cells[posX][posY].alive == true){
                cells[posX][posY].alive = false;
                cells[posX][posY].beenActive = false;
        }
    }
}


void drawCells(){
    for(int y = 0; y < numberOfRows; y++){
        for(int x = 0; x < numberOfColumns; x++){
            cells[x][y].draw();
        }
    }
}


void checkBoard(){
    int activeCells = 0;
    for(int y = 0; y < numberOfRows; y++){
        for(int x = 0; x < numberOfColumns; x++){
            countNeighbours(x, y);
            if(cells[x][y].alive){
                activeCells++;
            }
            cells[x][y].addNegihbourCount(tempNeighbourCount);
        }
    }
    checkSteadyState(activeCells);
}


void updateCells(){
    for(int y = 0; y < numberOfRows; y++){
        for(int x = 0; x < numberOfColumns; x++){
            cells[x][y].update();
        }
    }
}


void countNeighbours(int x, int y){
    tempNeighbourCount = 0;
    if(atEdges(x, y)){
        for(int deltaY = -1; deltaY < 2; deltaY++){
            for(int deltaX = -1; deltaX < 2; deltaX++){
                if(!(deltaY == 0 && deltaX == 0)){
                    if(cells[x + deltaX][y + deltaY].alive){
                        tempNeighbourCount++;
                    }
                }
            }
        }
    }
}


boolean atEdges(int x, int y){
    if((y == 0 || x == 0 || y == numberOfRows - 1 || x == numberOfColumns - 1)){
        countNeighboursEdges(x, y);
        return false;

    } else {
        return true;
    }
}


void countNeighboursEdges(int x, int y){
    int deltaY = -1, deltaX = -1, deltaYMax = 2, deltaXMax = 2;
    if(y == 0)
      deltaY = 0;
    if(y == numberOfRows - 1)
      deltaYMax = 1;
    if(x == 0)
      deltaX = 0;
    if(x == numberOfColumns -1)
      deltaXMax = 1;

    while(deltaY < deltaYMax){
        int tempDeltaX = deltaX;
        while(tempDeltaX < deltaXMax){
            if(!(deltaY == 0 && tempDeltaX == 0)){
                if(cells[x + tempDeltaX][y + deltaY].alive){
                    tempNeighbourCount++;
                }
            }
            tempDeltaX++;
        }
        deltaY++;
    }
}


void checkSteadyState(int numberOfActive){
    if(checkIfSteady(numberOfActive)){
        steady = true;
    } else {
        steady = false;
        steadyAt = generations - 29;
    }
}


boolean checkIfSteady(int numberOfActive){
    if(numberOfActive == numberOfPrevActiveCells){
        return true;
    }
    if(generations % 30 == 0){
        numberOfPrevActiveCells = numberOfActive;
    }
    return false;
}


void printSteadyState(){
    if(steady){
        fill(0);
        text("steady at: " + steadyAt + " generations" , 12, 20);
    }
}


void printGenerations(){
    fill(0);
    text("generations: " + generations, 12, 10);
}
