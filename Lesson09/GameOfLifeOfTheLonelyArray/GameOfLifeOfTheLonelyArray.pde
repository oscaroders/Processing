GameObject[] cells;
int[] neighbours;
int numberOfObjects, numberOfRows, numberOfColumns, tempNeighbourCount;
int fillPercentage = 15;
float cellSize = 10;

void setup(){
  size(600, 512);
  numberOfColumns = (int)Math.floor(width/cellSize);
  numberOfRows = (int)Math.floor(height/cellSize);
  numberOfObjects = numberOfColumns * numberOfRows;
  neighbours = new int[]{- numberOfColumns - 1, - numberOfColumns, - numberOfColumns + 1, -1, 1, numberOfColumns - 1, numberOfColumns, numberOfColumns + 1};
  cells = new GameObject[numberOfObjects];

  for(int i = 0; i < numberOfObjects; i++){
    cells[i] = new GameObject(((i + 1) % numberOfColumns) * cellSize, ((i / numberOfColumns) % numberOfRows) * cellSize, cellSize);
    if(random(100) < fillPercentage)
      cells[i].alive = true;
  }
}

void draw(){
  checkBoard();
  for(int i = 0; i < numberOfObjects; i++){
    cells[i].update();
    cells[i].draw();
  }
}

void checkBoard(){
  for(int i = 0; i < numberOfObjects; i++){
    tempNeighbourCount = 0;
    for(int j = 0; j < 8; j++){
      if(i + neighbours[j] >= 0 && i + neighbours[j] < numberOfObjects){ //Fix "edges" so it dosent wrap from one side to the other. (and up...)
        if(cells[i + neighbours[j]].alive){
          tempNeighbourCount++;
        }
      }
    }
    cells[i].addNegihbourCount(tempNeighbourCount);
  }
}
