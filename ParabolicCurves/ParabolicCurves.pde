int lineDistance = 20;

void setup(){
  size(1000,1000);
  strokeWeight(1);
}

void draw(){
  parabolicCurve();
}

void parabolicCurve(){

  for(int i = 0; i < height; i += lineDistance){
    line(0, i, i, height);

    if(i % 3 == 0){
      stroke(0);
    } else {
      stroke(75, 75, 75);
    }
  }
}
