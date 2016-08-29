float velSlide = 0;
float velSlide2 = 0;

void drawVelocity() {
  background(grey1);
  textFont(GEBold, 600*mult);
  fill(yellow);
  textAlign(CENTER);
  text(countUp2(readVel), (width/2)-(5*mult), 550*mult);
  velSlide += 0.2*mult;
  textAlign(LEFT);

  textFont(GEMid, 75*mult);
  fill(white);
  text("ft/min", 375*mult, 450*mult);

  textFont(GEBold, 150*mult);
  fill(white);
  

  text("SMOKE", velSlide2-(110*mult), 900*mult);
  textFont(GEBold, 140*mult);
  text("VELOCITY", (260*mult)-velSlide2, 1050*mult);
  if (velSlide2 < (250*mult)) {
    velSlide2 += mult*10;
  }
  if (velSlide2 >= 250*mult) {
    velSlide2 += 0.3;
  }
}

/*
int readVelocity() {
  return 24;
}*/