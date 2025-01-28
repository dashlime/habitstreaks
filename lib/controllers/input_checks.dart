class InputChecks {
  static String? checkHabitName(String name) {
    if (name.isNotEmpty) {
      return name;
    } else {
      return null;
    }
  }

  static int? checkDurationText(String duration) {
    duration = duration.replaceAll(':', '');

    duration = duration.padRight(4, '0');

    var hours = int.tryParse(duration.substring(0, 2));
    var minutes = int.tryParse(duration.substring(2, 4));

    if (hours == null || minutes == null) {
      return null;
    } else {
      if (hours < 0 || minutes < 0) {
        return null;
      }
      
      var number = 60 * hours + minutes;

      if (hours < 24 && minutes < 60) {
        return number;
      }
      else {
        return null;
      }
    }
  }

  static int? checkGoalDurationText(String duration) {
    var number = checkDurationText(duration);

    if (number == null) {
      return null;
    } else {
      if (number > 0) {
        return number;
      } else {
        return null;
      }
    }
  }

  static int? checkRepsNumberText(String reps) {
    var number = int.tryParse(reps);

    if (number == null) {
      return null;
    }

    if (number < 0) {
      return null;
    } else {
      return number;
    }
  }

  static int? checkGoalRepsNumberText(String reps) {
    var number = checkRepsNumberText(reps);

    if (number == null) {
      return null;
    } else {
      if (number > 0) {
        return number;
      } else {
        return null;
      }
    }
  }
}