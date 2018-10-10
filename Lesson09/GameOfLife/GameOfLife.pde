GameObject[][] cells;
int[][] neighbours;
int numberOfColumns;
int numberOfRows;
int tempNeighbourCount;
int fps = 2;
int fillPercentage = 15;
float cellSize = 10;

void setup(){
  //fullScreen();
  size(500, 500);
  background(0);
  frameRate(fps);
  ellipseMode(LEFT);

  numberOfColumns = (int)Math.floor(width/cellSize);
  numberOfRows = (int)Math.floor(height/cellSize);
  cells = new GameObject[numberOfColumns][numberOfRows];
  neighbours = new int[numberOfColumns][numberOfRows];

  for(int y = 0; y < numberOfRows; y++){
    for(int x = 0; x < numberOfColumns; x++){
      cells[x][y] = new GameObject(x * cellSize, y * cellSize, cellSize);
      if(random(100) < fillPercentage)
        cells[x][y].alive = true;
    }
  }
}

void draw(){
  speedChange();
  checkBoard();

  for(int y = 0; y < numberOfRows; y++){
    for(int x = 0; x < numberOfColumns; x++){
      cells[x][y].update();
      cells[x][y].draw();
    }
  }
}

void speedChange(){
  if((fps > 0) || (fps < 61)){
    if(pressedUp())
      fps++;
    if(pressedDown())
      fps--;
  }
  frameRate(fps);
}

void checkBoard(){
  for(int y = 0; y < numberOfRows; y++){
    for(int x = 0; x < numberOfColumns; x++){
      tempNeighbourCount = 0;
      if(checkEdges(x, y)){
        for(int i = -1; i < 2; i++){
          for(int j = -1; j < 2; j++){
            if(!(i == 0 && j == 0)){
              if(cells[x + j][y + i].alive){
                tempNeighbourCount++;
              }
            }
          }
        }
        neighbours[x][y] = tempNeighbourCount;
      }
      cells[x][y].addNegihbourCount(neighbours[x][y]);
    }
  }
}

boolean checkEdges(int x, int y){
  if((y == 0 || x == 0 || y == numberOfRows - 1 || x == numberOfColumns - 1)){
    int i = -1, j = -1, iMax = 2, jMax = 2;
    if(y == 0)
      i = 0;
    if(y == numberOfRows - 1)
      iMax = 1;
    if(x == 0)
      j = 0;
    if(x == numberOfColumns -1)
      jMax = 1;

    while(i < iMax){
      int tempJ = j;
      while(tempJ < jMax){
        if(!(i == 0 && tempJ == 0)){
          if(cells[x + tempJ][y + i].alive){
            tempNeighbourCount++;
          }
        }
        tempJ++;
      }
      i++;
    }
    neighbours[x][y] = tempNeighbourCount;
    return false;
  } else {
    return true;
  }
}
