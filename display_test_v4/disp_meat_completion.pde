float meatSlide2 = 0;
int circCounter = 0;
int circCounter2 = 0;

void drawMeat() {
  background(red1);
  noStroke();
  fill(white);
  if (circCounter < 800*mult) {
    ellipse(width/2, 450*mult, circCounter, circCounter); //800
    fill(red1);
    ellipse(width/2, 450*mult, circCounter/2, circCounter/2); //400
    circCounter += 20*mult;
  } else {
    ellipse(width/2, 450*mult, 800*mult, 800*mult); //800
    fill(red1);
    ellipse(width/2, 450*mult, 400*mult, 400*mult); //400
  }

  if (circCounter > 300*mult && circCounter2 < 800*mult) {
    fill(red2);
    arc(width/2, 450*mult, circCounter2, circCounter2, 1.5*PI, 1.5*PI+radiansScale(), PIE);
    fill(red1);
    arc(width/2, 450*mult, circCounter2/2, circCounter2/2, 1.5*PI, 1.5*PI+radiansScale(), PIE);

    circCounter2 += 16*mult;
  }


  if (circCounter2 >= 800*mult) {
    fill(red2);
    arc(width/2, 450*mult, 800*mult, 800*mult, 1.5*PI, 1.5*PI+radiansComp(), PIE);
    fill(red1);
    arc(width/2, 450*mult, 400*mult, 400*mult, 1.5*PI, 1.5*PI+radiansComp(), PIE);
  }

  textFont(GEBold, 170*mult);
  textAlign(CENTER);
  fill(white);
  text(countUp2(readMeat), width/2, 510*mult);
  textAlign(LEFT);

  textFont(GELight, 60*mult);
  fill(black);
  text("percent", 220*mult, 575*mult);

  textFont(GEBold, 90*mult);
  fill(white);

  text("MEAT COOKING", meatSlide2-(260*mult), 950*mult);
  textFont(GEBold, 105*mult);
  text("COMPLETION", (260*mult)-meatSlide2, 1050*mult);
  if (meatSlide2 < 250*mult) {
    meatSlide2 += 10*mult;
  }
  if (meatSlide2 >= 250*mult) {
    meatSlide2 += 0.3;
  }
}

/*int readMeat() {
  return 76;
}*/

float radiansComp() {
  float meatComp = readMeat;
  float meatRad;
  if (counter <= 3*readMeat) {
    meatRad = 0.0033*counter*2*PI;
  } else {
    meatRad = 2*PI*(meatComp/100);
  }
  //println(meatComp, meatRad);
  return meatRad;
}

float radiansScale() {
  float toReturn;
  float scaleVal = radiansComp();
  if (counter <= 3*readMeat) {
    toReturn = 0.0033*counter*2*PI;
  } else {
    return scaleVal;
  }
  //float toReturn = .00125*circCounter2*scaleVal;
  //println(circCounter2, scaleVal, toReturn);
  return toReturn;
}