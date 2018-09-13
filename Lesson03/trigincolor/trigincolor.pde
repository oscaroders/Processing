float frame = 0;
float multiplier = 0.04;
int numberOfPoints = 60;
int widthisch = 640;
int circleRad = 200;
int circleDiam = circleRad * 2;
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
  int lineDegreeLengt = 90;

    for(float angle = 0; radians(angle) < 2*PI; angle += 360/numberOfPoints){



      strokeWeight(1);
      point(center[0] + cos(radians(angle + frame)) * circleRad, center[1] + (sin(radians(angle + frame)) * circleRad));
      point(center[0] + cos(radians(angle + lineDegreeLengt + frame)) * circleRad, center[1] + (sin(radians(angle + lineDegreeLengt + frame)) * circleRad));
      LineCord connectLine = new LineCord(center[0] + cos(radians(angle + frame)) * circleRad,
                                          center[1] + (sin(radians(angle + frame)) * circleRad),
                                          center[0] + cos(radians(angle + lineDegreeLengt + frame)) * circleRad,
                                          center[1] + (sin(radians(angle + lineDegreeLengt + frame)) * circleRad));

      line(connectLine.x1, connectLine.y1, connectLine.x2, connectLine.y2);
      strokeWeight(3);
      stroke(0);
      noFill();
      ellipse(center[0], center[1], circleDiam, circleDiam);
      frame += 0.02;
		}
}


/*

LineCord axis1 = new LineCord(center[0] + (cos(radians(angle)) * cirkleRad),
                              center[1] + (sin(radians(angle)) * cirkleRad),
                              center[0] + (cos(radians(angle * 2)) * cirkleRad),
                              center[1] + (sin(radians(angle * 2)) * cirkleRad));

LineCord axis2 = new LineCord(center[0] + (cos(radians(angle * 2)) * cirkleRad),
                              center[1] + (sin(radians(angle * 2)) * cirkleRad),
                              center[0] + (cos(radians(angle * 4)) * cirkleRad),
                              center[1] + (sin(radians(angle * 4)) * cirkleRad));

int numberOfLines = 60;
ParabolicCurve kurva = new ParabolicCurve(axis1, axis2, numberOfLines);
kurva.drawParabolicCurve();

*/
