float frame = 0;
int numberOfPoints = 20;
int cirkleRad = 50;
float coils = 4;
float maxAngle = coils * PI * 2;
float steps = cirkleRad / maxAngle;
float distanceBetweenPoint = 1;


float rotation = 1;


void setup()
{
	size(640, 480);
	strokeWeight(5);
}

void draw()
{
	background(255);
  int[] center1 = {width / 4, 240};
	int[] center2 = {3 * width / 4, 240};

    for(float angle = 0; radians(angle) < 2*PI; angle += 360/numberOfPoints){
      point(center1[0] + cos(radians(angle + frame)) * cirkleRad, center1[1] + (sin(radians(angle + frame)) * cirkleRad));
			frame++;
		}

		for(float angle = 0; radians(angle) < maxAngle; angle ++){
			float away = angle * 0.1;
			point(center2[0] + cos(radians(angle)) * away,
						center2[1] + (sin(radians(angle)) * away));

		}
}
