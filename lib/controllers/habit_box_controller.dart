import 'package:drift/drift.dart';
import 'package:habitstreaks/models/habit.dart';
import 'package:habitstreaks/services/database.dart';
import 'package:habitstreaks/controllers/habit_items_utility.dart';

class HabitBoxController {
  final HabitWithItems habit;

  const HabitBoxController({required this.habit});

  void updateHabitDayItemValue(int newValue, DateTime date, Database db) {
    var item = HabitItemsUtility.getHabitDayItemByDate(habit, date);

    if (item == null) {
      db.addHabitDayItem(HabitDayItemCompanion(
        habitId: Value(habit.habit.id),
        date: Value(date),
        value: Value(newValue)
      ));
    } else {
      db.updateHabitDayItemValue(item, newValue);
    }
  }
}