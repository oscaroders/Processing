int frame = 0;
float multiplier = 0.04;
int numberOfPoints = 100;
int widthisch = 640;
int pointDistance = (widthisch/numberOfPoints) + 1;

void setup()
{
	size(640, 480);
	strokeWeight(5);
}

void draw()
{
	background(255);

	//Draw animated point
    for(int i = 0; i < numberOfPoints; i++){
         stroke(i*2, 0, 0);
         point(i * pointDistance, height/2 + sin((i + frame) * multiplier) * 200);
         stroke(0, i*2, 0);
         point(i * pointDistance, height/2 + cos((i + frame) * multiplier) * 200);
    }
    frame++;

}
