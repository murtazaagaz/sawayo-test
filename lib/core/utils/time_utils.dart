class TimeUtils
 {
  static int convertTimeIn24(String timings) {
    List<String> splittedTime = timings.split(' ');
    String meridiem = splittedTime[1];
    int time = int.parse(splittedTime[0]);
    if (meridiem.contains('PM')) {
      return 12 + time;
    }
    return time;
  }

  static String convertTimeIn12(int timings) {
    if (timings > 12) {
      int convertedTime = timings - 12;
      return '$convertedTime PM';
    }
    return '$timings AM';
  }
}
