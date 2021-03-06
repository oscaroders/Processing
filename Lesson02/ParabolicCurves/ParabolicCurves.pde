int lineDistance = 50;
int frame = 0;

void setup(){
  size(1000,1000);
  strokeWeight(1);
  background(255);
  stroke(0);
}

void draw(){

  parabolicCurve();
  background(255);
  LineCord yAxis = new LineCord(63, 66, 474 ,708);
  LineCord xAxis = new LineCord(yAxis.x2, yAxis.y2, 920, 63);
  int numberOfLines = 60;
  ParabolicCurve kurva = new ParabolicCurve(xAxis, yAxis, numberOfLines);
  kurva.drawParabolicCurve();

  parabolicCurve();

}


void parabolicCurve(){

  for(int i = 0; i < height; i += lineDistance){

    //line(0, i, i, height);
    line((i + frame) % height, height, width, height-(i + frame) % height);
    //line(i, 0, width, i);
    line(width-(i + frame) % height, 0, 0, (i + frame) % height);


    if(i % 3 == 0){
      stroke(225, 225, 0);
    } else {
      stroke(75, 75, 75);
    }
  }

  frame += 5;
}
