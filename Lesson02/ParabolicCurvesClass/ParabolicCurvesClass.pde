public class ParabolicCurve {

  float[] axisX = new float[4];
  float[] axisY = new float[4];
  int numberOfLines;

  public ParabolicCurve(float[] setAxisX, float[] setAxisY, int setNumberOfLines){
    this.axisX = setAxisX;
    this.axisY = setAxisY;
    numberOfLines = setNumberOfLines;
  }

  public void drawParabolicCurve(){
      println(axisX);
  }
}

//array = {x1, y1, x2, y2}
float[] yAxis = {10, 10, 10 ,500};
float[] xAxis = {yAxis[2], yAxis[3], 500, 500};

void setup(){
  size(1000, 1000);
  noLoop();
}



void draw(){

  ParabolicCurve kurva = new ParabolicCurve(xAxis, yAxis, 10);
  kurva.drawParabolicCurve();

}
