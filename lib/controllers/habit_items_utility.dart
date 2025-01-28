import 'package:habitstreaks/models/habit.dart';
import 'package:collection/collection.dart';
import 'package:habitstreaks/services/database.dart'; 

extension DateOnlyCompare on DateTime {
  bool isSameDate(DateTime other) {
    return year == other.year && month == other.month
           && day == other.day;
  }
}

class HabitItemsUtility {
  static HabitDayItem? getHabitDayItemByDate(HabitWithItems habit, DateTime date) {
    return habit.items.firstWhereOrNull((item) => item.date.isSameDate(date));
  }

  static double getHabitDayItemScore(HabitWithItems habit, DateTime date) {
    var item = getHabitDayItemByDate(habit, date);

    if (item == null) {
      return 0;
    } else {
      return item.value.toDouble() / habit.habit.goalFormatted.toDouble();
    }
  }

  static HabitDayItem? getOldestHabitDayItem(List<HabitDayItem> items) {
    if (items.isEmpty) {
      return null;
    }

    // Using reduce to find the HabitDayItem with the earliest date
    return items.reduce((a, b) => a.date.isBefore(b.date) ? a : b);
  }
}