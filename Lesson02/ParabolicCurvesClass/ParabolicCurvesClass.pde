public class ParabolicCurve {

  LineCord axisY = new LineCord();
  LineCord axisX = new LineCord();
  int numberOfLines;

  public ParabolicCurve(LineCord axisX, LineCord axisY, int setNumberOfLines){

    this.axisX = axisX;
    this.axisY = axisY;
    numberOfLines = setNumberOfLines;
  }

  public void drawParabolicCurve(){
        float xDistanceForX = axisX.x2 - axisX.x1;
        float yDistanceForX = axisX.y2 - axisX.y1;

        float xDistanceForY = axisY.x2 - axisY.x1;
        float yDistanceForY = axisY.y2 - axisY.y1;


        for(int i = 0; i < numberOfLines; i++){

          if(i % 3 == 0){
            stroke(0);
          } else {
            stroke(128);
          }

          float lineX1 = axisX.x1 + i * xDistanceForX;
          float lineY1 = axisX.y1 + i * yDistanceForX;

          float lineX2 = axisY.x1 + i * xDistanceForX;
          float lineY2 = axisY.y1 + i * yDistanceForX;

          line(lineX1,lineY1,lineX2,lineY2);
      }
  }
}

public class LineCord{
  float x1;
  float y1;
  float x2;
  float y2;

  public LineCord(float x1, float y1, float x2, float y2){
    this.x1 = x1;
    this.y1 = y1;
    this.x2 = x2;
    this.y2 = y2;
  }

  public LineCord(){
    this.x1 = 0;
    this.y1 = 0;
    this.x2 = 0;
    this.y2 = 0;
  }
}

//array = {x1, y1, x2, y2}
LineCord yAxis = new LineCord(10, 10, 10 ,500);
LineCord xAxis = new LineCord(yAxis.y1, yAxis.y2, 500, 500);

void setup(){
  size(1000, 1000);
}

void draw(){

  background(255);
  ParabolicCurve kurva = new ParabolicCurve(xAxis, yAxis, 10);
  kurva.drawParabolicCurve();

}
