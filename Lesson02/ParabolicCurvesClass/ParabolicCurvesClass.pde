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

        for(int i = 0; i < numberOfLines; i++){

          strokeWeight(1);

          if(i % 3 == 0){
            stroke(0);
          } else {
            stroke(0, 255, 0);
          }

          float lineX1 = distance(axisX, 'x', i);
          float lineY1 = distance(axisX, 'y', i);

          float lineX2 = distance(axisY, 'x', i);
          float lineY2 = distance(axisY, 'y', i);

          line(lineX1, lineY1, lineX2, lineY2);

          stroke(0);
          strokeWeight(3);
          line(axisX.x1, axisX.y1, axisX.x2, axisX.y2);
          line(axisY.x1, axisY.y1, axisY.x2, axisY.y2);
      }
  }

  float distance(LineCord axis, char xory, int i){
    if(xory == 'x'){
      float xDistance = axis.x1 + (i * (axis.x2 - axis.x1) / numberOfLines);
      return xDistance;
    } else {
      float yDistance = axis.y1 + (i * (axis.y2 - axis.y1) / numberOfLines);
      return yDistance;
    }

    // Make exeptionhandler here...

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

void setup(){
  size(1000, 1000);
}

void draw(){

  background(255);
  LineCord yAxis = new LineCord(63, 66, 474 ,708);
  LineCord xAxis = new LineCord(yAxis.x2, yAxis.y2, 920, 63);
  int numberOfLines = 60;
  ParabolicCurve kurva = new ParabolicCurve(xAxis, yAxis, numberOfLines);
  kurva.drawParabolicCurve();
}
