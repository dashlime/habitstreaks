class Converters {
  static String durationToText(int duration) {
    var hours = (duration / 60).toInt();
    var minutes = duration % 60;

    return "${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}";
  }
}