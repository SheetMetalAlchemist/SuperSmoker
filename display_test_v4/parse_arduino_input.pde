/*float readSens(String sensName) {
  String val1, val2, val3, val4;                         // Data received from the serial port
  String dataClean[];

  if ( arduino1.available() > 0) 
  {  // If data is available,
    val1 = arduino1.readStringUntil('\n');         // read it and store it in val
  }

  if ( arduino2.available() > 0) 
  {  // If data is available,
    val2 = arduino2.readStringUntil('\n');         // read it and store it in val
  }

  if ( arduino3.available() > 0) 
  {  // If data is available,
    val3 = arduino3.readStringUntil('\n');         // read it and store it in val
  }

  if ( arduino4.available() > 0) 
  {  // If data is available,
    val4 = arduino4.readStringUntil('\n');         // read it and store it in val
  }

  switch(sensName) {

  case "humidity":
    if (val4 != null) {
      val4 = trim(val4);                     //remove leading and tailing whitespace
      dataClean = splitTokens(val4);
      if (dataClean.length > 0) {
        return float(dataClean[0]);
      }
      else return 0;
    }
    else return 0;
    break;

  case "meat":
    if (val3 != null) {
      val3 = trim(val3);                     //remove leading and tailing whitespace
      dataClean = splitTokens(val3);
      if (dataClean.length > 0) {
        return float(dataClean[0]);
      }
    }
    break;

  case "c1":
    if (val2 != null) {
      val2 = trim(val2);                     //remove leading and tailing whitespace
      dataClean = splitTokens(val2);
      if (dataClean.length > 0) {
        return float(dataClean[0]);
      }
    }
    break;

  case "c2":
    if (val2 != null) {
      val2 = trim(val2);                     //remove leading and tailing whitespace
      dataClean = splitTokens(val2);
      if (dataClean.length > 0) {
        return float(dataClean[1]);
      }
    }
    break;

  case "c3":
    if (val1 != null) {
      val1 = trim(val1);                     //remove leading and tailing whitespace
      dataClean = splitTokens(val1);
      if (dataClean.length > 0) {
        return float(dataClean[0]);
      }
    }
    break;
  }
}
*/