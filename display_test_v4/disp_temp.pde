int numPoints = 30;
int constrictVal = 7;
int originX = 25*mult;
int originY = (690*mult)+1120;
int yAxisEnd = (380*mult)+1120;
int xAxisEnd = 585*mult;
int graphWidth = xAxisEnd-originX-(25*mult);
int graphHeight = originY-yAxisEnd;

float[] tempA = new float[numPoints];
float[] tempB = new float[numPoints];
float[] tempC = new float[numPoints];
float[] tempArray = new float[numPoints];
float[] tempArray2 = new float[numPoints];
float[] tempArray4 = new float[numPoints];
float[] rangeArray = new float[numPoints*3];
float range = 0;
float top = 0;
float bottom = 0;
boolean readComplete = false;

int graphScroller = 0;

float tempSlide = 0;
float tempSlide2 = 0;

{
  for (int i = 0; i < tempA.length; i++) {
    tempA[i] = 0;
  }
}
{
  for (int i = 0; i < tempB.length; i++) {
    tempB[i] = 0;
  }
}
{
  for (int i = 0; i < tempC.length; i++) {
    tempC[i] = 0;
  }
}

void drawTemp() {
  background(grey1);
  if (readComplete == false) {
    readTemp(1);
    readTemp(2);
    readTemp(3);
  }
  
  textFont(GEBold, 100*mult);
  fill(red2);
  text("top", 15*mult, (1080+100*mult));
  text(countUp3(readT1), 375*mult, (1080+100*mult));
  textFont(GEBold, 50*mult);
  text("o", 550*mult, (1080+50*mult));
  textFont(GEBold, 100*mult);
  text("F", 575*mult, (1080+100*mult));
  
  textFont(GEBold, 100*mult);
  fill(yellow);
  text("middle", 15*mult, (1080+220*mult));
  text(countUp3(readT2), 375*mult, (1080+220*mult));
  textFont(GEBold, 50*mult);
  text("o", 550*mult, (1080+170*mult));
  textFont(GEBold, 100*mult);
  text("F", 575*mult, (1080+220*mult));
  
  textFont(GEBold, 100*mult);
  fill(blue2);
  text("bottom", 15*mult, (1080+340*mult));
  text(countUp3(readT3), 375*mult, (1080+340*mult));
  textFont(GEBold, 50*mult);
  text("o", 550*mult, (1080+290*mult));
  textFont(GEBold, 100*mult);
  text("F", 575*mult, (1080+340*mult));
  
  drawAxes();
  pushMatrix();
  translate(originX, originY);
  rotate(radians(180));              //Vertical is a positive number, horizontal axis is a negative number
  defineRange();                     
  drawTrend(tempA, 1, graphScroller);
  drawTrend(tempB, 2, graphScroller);
  drawTrend(tempC, 3, graphScroller);
  //ellipseMode(CENTER);
  //ellipse(0, 0, 5, 5);
  popMatrix();
  
  fill(white);
  textFont(GEBold, 135*mult);
  text("CHAMBER", tempSlide-(245*mult), (900*mult)-2160);
  textFont(GEBold, 90*mult);
  text("TEMPERATURE", 285*mult-(tempSlide), (1000*mult)-2160);
  if (tempSlide < 250*mult) {
    tempSlide += 10*mult;
  } 
  if (tempSlide >= 250*mult) {
    tempSlide += 0.3;
  }
  
  readComplete = true;
  graphScroller++;
}

void defineRange() {
  for (int i = 0; i<tempA.length; i++) {
    rangeArray[i] = tempA[i];
    rangeArray[numPoints+i] = tempB[i];
    rangeArray[(2*numPoints)+i] = tempC[i];
  }
  //println(rangeArray);
  top = max(rangeArray)+constrictVal;
  bottom = min(rangeArray)-constrictVal;
  range = top-bottom;
  //println(top, bottom, range);

  stroke(grey2);
  strokeWeight(1);
  line(0, graphHeight/4, -graphWidth+(10*mult), graphHeight/4);
  line(0, 2*(graphHeight/4), -graphWidth+(10*mult), 2*(graphHeight/4));
  line(0, 3*(graphHeight/4), -graphWidth+(10*mult), 3*(graphHeight/4));
  line(0, 4*(graphHeight/4), -graphWidth+(10*mult), 4*(graphHeight/4)); 

  pushMatrix();
  rotate(radians(-180));
  textFont(GELight, 35*mult);
  String t1 = str(bottom+(range/4)).substring(0, 3);
  String t2 = str(bottom+(2*(range/4))).substring(0, 3);
  String t3 = str(bottom+(3*(range/4))).substring(0, 3);
  String t4 = str(bottom+(4*(range/4))).substring(0, 3);
  
  //text(str(bottom).substring(0, 3), graphWidth+10, 0);
  text(t1, graphWidth-20, -(graphHeight/4)+25);
  text(t2, graphWidth-20, -2*(graphHeight/4)+25);
  text(t3, graphWidth-20, -3*(graphHeight/4)+25);
  text(t4, graphWidth-20, -4*(graphHeight/4)+25);
  
  textFont(GELight, 15*mult);
  text("o", graphWidth+145, -(graphHeight/4)-25);
  text("o", graphWidth+145, -2*(graphHeight/4)-25);
  text("o", graphWidth+145, -3*(graphHeight/4)-25);
  text("o", graphWidth+145, -4*(graphHeight/4)-25);
  
  textFont(GELight, 35*mult);
  text("F", graphWidth+165, -(graphHeight/4)+25);
  text("F", graphWidth+165, -2*(graphHeight/4)+25);
  text("F", graphWidth+165, -3*(graphHeight/4)+25);
  text("F", graphWidth+165, -4*(graphHeight/4)+25);
  
  popMatrix();
}


void drawTrend(float tempArray3 [], int trendVal, int graphScroller) {
  switch(trendVal) {
  case 1:
    stroke(red2);
    break;

  case 2:
    stroke(yellow);
    break;

  case 3:
    stroke(blue2);
    break;
  }

  for (int i = 0; i<tempB.length; i++) {
    tempArray4[i] = map(tempArray3[i], bottom, top, 0, graphHeight);
  }

  noFill();
  strokeWeight(16*mult);
  if (graphScroller < (numPoints-1)) {
    {
      for (int i = 0; i<graphScroller; i++) {
        line(-i*(graphWidth/tempArray4.length), tempArray4[i], -(i+1)*(graphWidth/tempArray4.length), tempArray4[i+1]);
      }
    }
  } else {
    {
      for (int i = 0; i<(numPoints-1); i++) {
        line(-i*(graphWidth/tempArray4.length), tempArray4[i], -(i+1)*(graphWidth/tempArray4.length), tempArray4[i+1]);
      }
    }
  }
  
  /*
  fill(white);
  stroke(black);
  strokeWeight(1);
  ellipseMode(CENTER);
  */
  
}  

void drawAxes() {
  noFill();
  stroke(white);
  strokeWeight(10*mult);
  line(originX, yAxisEnd, originX, originY);
  line(originX, originY, xAxisEnd, originY);
  textFont(GELight, 60*mult);
  fill(white);
  //text("TIME (min)", 200*mult, 780*mult);
  /*pushMatrix();
  translate(60, 650);
  rotate(radians(270));
  text("TEMP ( F)", 0, 0);
  textFont(GELight, 30);
  text("o", 163, -30);
  popMatrix(); */
}

float[] pushArray(float inputArray[]) { 
  {                                                    //treats an array like a stack - pushes a new value on top, then ditches other vals
    for (i = 0; i < inputArray.length-1; i++) {
      inputArray[i] = inputArray[i+1];
    }
  }
  return inputArray;
}


void readTemp(int sensNumber) {
  switch(sensNumber) {
  case 1:
    tempA = pushArray(tempA);
    tempA[numPoints-1] = readT1;
    //tempA[loop] = readT1;
   // lastTemp1 = tempA[29];
    break;

  case 2:
    tempB = pushArray(tempB);
    tempB[numPoints-1] = readT2;
    //tempB[loop] = readT2;
   // lastTemp2 = tempB[29];
    break;

  case 3:
    tempC = pushArray(tempC);
    tempC[numPoints-1] = readT3;
  //  lastTemp3 = tempC[29];
    break;
  }
}