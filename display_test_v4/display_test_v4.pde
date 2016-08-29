import processing.serial.*;

Serial arduino1;  // Create object from Serial class
Serial arduino2;
Serial arduino3;
Serial arduino4;

String val1, val2, val3, val4;     // Data received from the serial port
String dataClean[];
float readHum, readVel, readMeat, readT1, readT2, readT3;

//String[] fontList = PFont.list();
//printArray(fontList);

int loop = 0;
int mult=3;
int counter = 0;
int i = 0;
float toReturn = 0;
int timeClip = 0;
boolean resetFlag = false;

color white = #ffffff;
color black = #000000;
color grey1 = #48484a;
color grey2 = #878787;
color blue1 = #01437d;
color blue2 = #01abe8;
color red1 = #d9192e;
color red2 = #f26868;
color yellow = #ffb214;
color green = #26ac4b;

PFont GEBold, GEMid, GELight;

void setup() {
  fullScreen(P2D, SPAN);
  textMode(SHAPE);
  smooth(4);
  frameRate(50);
  GEBold = createFont("GE Inspira Medium Bold", 380, true); //1150
  GEMid = createFont("GE Inspira Bold", 150, true); //500
  GELight = createFont("GE Inspira", 100, true); //300

  // I know that the first port in the serial list on my mac
  // is Serial.list()[0].
  // On Windows machines, this generally opens COM1.
  // Open whatever port is the one you're using.
  String ardPort1 = Serial.list()[1]; //change the 0 to a 1 or 2 etc. to match your port
  String ardPort2 = Serial.list()[2];
  String ardPort3 = Serial.list()[3];
  String ardPort4 = Serial.list()[4];
  arduino1 = new Serial(this, ardPort1, 9600);
  arduino2 = new Serial(this, ardPort2, 9600);
  arduino3 = new Serial(this, ardPort3, 9600);
  arduino4 = new Serial(this, ardPort4, 9600);
}

void draw() { 
  if (timeClip < 350) {
    if ( arduino4.available() > 0) 
    {  // If data is available,
      val4 = arduino4.readStringUntil('\n');         // read it and store it in val
    } 

    if (val4 != null) {
      val4 = trim(val4);                     //remove leading and tailing whitespace
      dataClean = splitTokens(val4);
      if (dataClean.length > 0) {
        readHum = float(dataClean[0]);
      }
    }
    drawHumidity();
    //createTestLines();
  }

  if (timeClip >= 350 && timeClip < 370) {
    noStroke();
    fill(grey1, 0.1*(255*(timeClip-350)/12));
    rect(0, 0, width, height);
    i = 0;
    //createTestLines();
  }

  if (timeClip >= 370 && timeClip < 720) {
    if (timeClip % floor(random(20, 40)) == 1) {
      readVel = random(9, 14);
    }
    drawVelocity();
    //createTestLines();
  }

  if (timeClip >= 720 && timeClip < 740) {
    noStroke();
    fill(red1, 0.1*(255*(timeClip-720)/12));
    rect(0, 0, width, height);
    i = 0;
    //createTestLines();
    resetFlag = true;
  }

  if (timeClip >= 740 && timeClip < 1090) {
    resetCounter();
    resetFlag = false;
    if ( arduino3.available() > 0) 
    {  // If data is available,
      val3 = arduino3.readStringUntil('\n');         // read it and store it in val
    } 

    if (val3 != null) {
      val3 = trim(val3);                     //remove leading and tailing whitespace
      dataClean = splitTokens(val3);
      if (dataClean.length > 0) {
        readMeat = 100*((float(dataClean[0])-12)/150);
      }
    }
    drawMeat();
    //createTestLines();
  }

  if (timeClip >= 1090 && timeClip < 1120) {
    noStroke();
    fill(grey1, 0.1*(255*(timeClip-1090)/12));
    rect(0, 0, width, height);
    i = 0;
    //createTestLines();
  }

  if (timeClip >= 1120 && timeClip < 1470) {
    if ( arduino2.available() > 0) 
    {  // If data is available,
      val2 = arduino2.readStringUntil('\n');         // read it and store it in val
    } 
    if ( arduino1.available() > 0) 
    {  // If data is available,
      val1 = arduino1.readStringUntil('\n');         // read it and store it in val
    } 

    if (val1 != null) {
      val1 = trim(val1);                     //remove leading and tailing whitespace
      dataClean = splitTokens(val1);
      if (dataClean.length > 0) {
        readT3 = (float(dataClean[0])*1.8)+32;
      }
    }
    if (val2 != null) {
      val2 = trim(val2);                     //remove leading and tailing whitespace
      dataClean = splitTokens(val2);
      if (dataClean.length > 0) {
        readT1 = (float(dataClean[0])*1.8)+32;
        readT2 = (float(dataClean[1])*1.8)+32;
      }
    }
    drawTemp();
    //createTestLines();
  }

  if (timeClip >= 1470 && timeClip < 1500) {
    noStroke();
    fill(blue1, 0.1*(255*(timeClip-1470)/12));
    rect(0, 0, width, height);
    i = 0;
    //createTestLines();
  }

  if (timeClip >= 1500) {
    timeClip = 0;
    counter = 0;
    toReturn = 0;
    graphScroller = 0;
    humSlide = 0;
    humSlide2 = 0;
    meatSlide2 = 0;
    tempSlide = 0;
    tempSlide2 = 0;
    velSlide = 0;
    velSlide2 = 0;
    readComplete = false;
  }

  timeClip++;
  //println(timeClip);
  //saveFrame("anim-#####.png");

  //drawTemp();
}

void resetCounter() {
  if (resetFlag == true) {
    counter = 0;
  }
}

String countUp(float currentVal) {

  if (counter % 3 == 0) {
    if (i < currentVal) {
      toReturn = i;
    } else {
      toReturn = currentVal;
    }
    i++;
  }
  counter++;
  return str(toReturn);
}

String countUp2(float currentVal) {

  if (counter % 3 == 0) {
    if (i < currentVal) {
      toReturn = i;
    } else {
      toReturn = currentVal;
    }
    i++;
  }
  counter++;
  String returnString = str(toReturn);
  int finalIndex = returnString.indexOf(".");
  return returnString.substring(0, finalIndex);
}

String countUp3(float currentVal) {

  if (i < currentVal) {
    toReturn = i;
  } else {
    toReturn = currentVal;
  }
  i++;
  counter++;
  String returnString = str(toReturn);
  int finalIndex = returnString.indexOf(".");
  return returnString.substring(0, finalIndex);
}

void createTestLines() {
  stroke(white);
  strokeWeight(5);
  line(0, 1080/3, 640, 1080/3);
  line(0, 2*(1080/3), 640, 2*(1080/3));
}