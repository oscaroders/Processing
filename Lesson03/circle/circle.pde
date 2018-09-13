float frame = 0;
float multiplier = 0.04;
int numberOfPoints = 20;
int widthisch = 640;
int cirkleRad = 50;
int pointDistance = (widthisch/numberOfPoints) + 1;

void setup()
{
	size(640, 480);
	strokeWeight(5);
}

void draw()
{
	background(255);
  int[] center = {320, 240};

    for(float angle = 0; radians(angle) < 2*PI; angle += 360/numberOfPoints){
      point(center[0] + cos(radians(angle + frame)) * cirkleRad, center[1] + (sin(radians(angle + frame)) * cirkleRad));
			frame++;
		}
}
