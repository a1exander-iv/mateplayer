String secondsToString(int seconds) {
  String resultString = "";

  int hours = (seconds ~/ 3600);
  int minutes = (seconds ~/ 60 % 60);
  int resultSeconds = (seconds % 60);

  if (hours >= 1) {
    resultString += "$hours:";
  }
  if (minutes < 10) {
    resultString += "0$minutes:";
  } else {
    resultString += "$minutes:";
  }

  if (resultSeconds < 10) {
    resultString += "0$resultSeconds";
  } else {
    resultString += "$resultSeconds";
  }

  return resultString;
}
