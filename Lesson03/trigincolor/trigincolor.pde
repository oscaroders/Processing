float frame = 0;
float multiplier = 0.04;
int numberOfPoints = 84;
int widthisch = 640;
float sizeCount = 1;
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

  sizeCount += 0.02;

  float circleRad = 150;
  float circleDiam = circleRad * 2;

	strokeWeight(20);
	stroke(random(0,255), random(0,255), random(0,255));
	point(25,25);
	stroke(random(0,255), random(0,255), random(0,255));
	point(25, height - 25);
	stroke(random(0,255), random(0,255), random(0,255));
	point(width - 25 ,25);
	stroke(random(0,255), random(0,255), random(0,255));
	point(width - 25, height - 25);

  for(float angle = 0; radians(angle) < 2*PI; angle += 360/numberOfPoints){



    strokeWeight(1);
    stroke(128 + sin(angle)*100, 128 + cos(frame) * 100, 128 + tan(circleRad));
    //point(center[0] + cos(radians(angle + frame)) * circleRad, center[1] + (sin(radians(angle + frame)) * circleRad));
    //point(center[0] + cos(radians(angle + lineDegreeLengt + frame)) * circleRad, center[1] + (sin(radians(angle + lineDegreeLengt + frame)) * circleRad));
    LineCord connectLine = new LineCord(center[0] + cos(radians(angle - frame)) * circleRad*1.5,
                                        center[1] + (sin(radians(angle - frame)) * circleRad*1.5),
                                        center[0] + cos(radians(angle + lineDegreeLengt - frame)) * circleRad*1.5,
                                        center[1] + (sin(radians(angle + lineDegreeLengt - frame)) * circleRad*1.5));

    line(connectLine.x1, connectLine.y1, connectLine.x2, connectLine.y2);
    strokeWeight(5);
    stroke(0);
    noFill();
    ellipse(center[0], center[1], circleDiam, circleDiam);
  }


  strokeWeight(3);
  stroke(255, 255, 0);
  fill(230, 0, 0);
  ellipse(center[0], center[1], circleDiam, circleDiam);

    for(float angle = 0; radians(angle) < PI/2; angle += 90/numberOfPoints){

      strokeWeight(1);
      //point(center[0] + cos(radians(angle + frame +90)) * circleRad, center[1] + (sin(radians(angle + frame +90)) * circleRad));
      //point(center[0] + cos(radians(angle + lineDegreeLengt + frame +90)) * circleRad, center[1] + (sin(radians(angle + lineDegreeLengt + frame +90)) * circleRad));
      LineCord connectLine = new LineCord(center[0] + cos(radians(angle + frame +90)) * circleRad,
                                          center[1] + (sin(radians(angle + frame +90)) * circleRad),
                                          center[0] + cos(radians(angle + lineDegreeLengt + frame +90)) * circleRad,
                                          center[1] + (sin(radians(angle + lineDegreeLengt + frame +90)) * circleRad));

      line(connectLine.x1, connectLine.y1, connectLine.x2, connectLine.y2);
      //frame += 0.02;
		}

    for(float angle = 0; radians(angle) < PI/2; angle += 90/numberOfPoints){

      strokeWeight(1);
      //point(center[0] + cos(radians(angle + frame +90)) * circleRad, center[1] + (sin(radians(angle + frame +90)) * circleRad));
      //point(center[0] + cos(radians(angle + lineDegreeLengt + frame +90)) * circleRad, center[1] + (sin(radians(angle + lineDegreeLengt + frame +90)) * circleRad));
      LineCord connectLine = new LineCord(center[0] + cos(radians(angle + frame -90)) * circleRad,
                                          center[1] + (sin(radians(angle + frame -90)) * circleRad),
                                          center[0] + cos(radians(angle + lineDegreeLengt + frame -90)) * circleRad,
                                          center[1] + (sin(radians(angle + lineDegreeLengt + frame -90)) * circleRad));

      line(connectLine.x1, connectLine.y1, connectLine.x2, connectLine.y2);
      //frame += 0.02;
    }

    for(float angle = 0; radians(angle) < PI/2; angle += 90/numberOfPoints){

      strokeWeight(1);
      //point(center[0] + cos(radians(angle + frame +90)) * circleRad, center[1] + (sin(radians(angle + frame +90)) * circleRad));
      //point(center[0] + cos(radians(angle + lineDegreeLengt + frame +90)) * circleRad, center[1] + (sin(radians(angle + lineDegreeLengt + frame +90)) * circleRad));
      LineCord connectLine = new LineCord(center[0] + cos(radians(angle + frame -180)) * circleRad,
                                          center[1] + (sin(radians(angle + frame -180)) * circleRad),
                                          center[0] + cos(radians(angle *2 + lineDegreeLengt + frame -180)) * circleRad,
                                          center[1] + (sin(radians(angle *2 + lineDegreeLengt + frame -180)) * circleRad));

      line(connectLine.x1, connectLine.y1, connectLine.x2, connectLine.y2);
      //frame += 0.02;
    }

    for(float angle = 0; radians(angle) < PI/2; angle += 90/numberOfPoints){

      strokeWeight(1);
      //point(center[0] + cos(radians(angle + frame +90)) * circleRad, center[1] + (sin(radians(angle + frame +90)) * circleRad));
      //point(center[0] + cos(radians(angle + lineDegreeLengt + frame +90)) * circleRad, center[1] + (sin(radians(angle + lineDegreeLengt + frame +90)) * circleRad));
      LineCord connectLine = new LineCord((center[0] + -1*cos(radians(angle - frame +180)) * circleRad),
                                          (center[1] + (sin(radians(angle - frame +180)) * circleRad)),
                                          (center[0] + -1*cos(radians(angle *2 + lineDegreeLengt - frame +180)) * circleRad) ,
                                          (center[1] + (sin(radians(angle *2 + lineDegreeLengt - frame +180)) * circleRad)));

      line(connectLine.x1, connectLine.y1, connectLine.x2, connectLine.y2);

    }
    frame += 0.1;
}
