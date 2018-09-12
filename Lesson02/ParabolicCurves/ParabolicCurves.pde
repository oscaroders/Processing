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

}


void parabolicCurve(){

  for(int i = 0; i < height; i += lineDistance){

    line(0, (i + frame) % height, (i + frame) % height, height);
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
