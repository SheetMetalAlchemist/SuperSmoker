float humSlide = 0;
float humSlide2 = 0;

void drawHumidity() {
  background(blue1);
  textFont(GEBold, 350*mult);
  fill(white);
  text(countUp(readHum), -10*mult, 470*mult);
  humSlide += 0.2;

  textFont(GEMid, 85*mult);
  fill(grey2);
  text("percent", 335*mult, 425*mult);

  textFont(GEBold, 155*mult);
  fill(white);

  text("RELATIVE", humSlide2-(280*mult), 875*mult);
  textFont(GEBold, 145*mult);
  text("HUMIDITY", (270*mult)-humSlide2, 1050*mult);
  if (humSlide2 < (250*mult)) {
    humSlide2 += (10*mult);
  }
  if (humSlide2 >= 250) {
    humSlide2 += .3;
  }
}