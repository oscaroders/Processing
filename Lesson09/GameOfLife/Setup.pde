void gameSetup(){
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
