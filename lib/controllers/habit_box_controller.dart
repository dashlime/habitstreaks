import 'dart:async';

import 'package:drift/drift.dart';
import 'package:habitstreaks/models/habit.dart';
import 'package:habitstreaks/services/database.dart';
import 'package:habitstreaks/controllers/habit_items_utility.dart';

const int emptyRowsBeforeHabitCreation = 30;

class HabitBoxController {
  HabitWithItems? habit;
  StreamController<List<HabitDayItem>> itemsListController = StreamController();

  void updateHabit(HabitWithItems newHabit) {
    if (habit != newHabit) {
      habit = newHabit;

      var firstItemDate = HabitItemsUtility.getOldestHabitDayItem(newHabit.items)?.date ?? DateTime.now();
      var rowsNumber = DateTime.now().difference(firstItemDate).inDays + emptyRowsBeforeHabitCreation;

      final List<HabitDayItem> items = <HabitDayItem>[];

      var date = DateTime.now();
      for (int row = 0; row < rowsNumber; row++) {
        var item = HabitItemsUtility.getHabitDayItemByDate(newHabit, date);

        if (item != null) {
          items.add(item);
        } else {
          items.add(HabitDayItem(id: -1, habitId: newHabit.habit.id, date: date, value: 0));
        }

        date = date.add(Duration(days: -1));
      }

      itemsListController.add(items);
    }
  }

  void updateHabitDayItemValue(int newValue, DateTime date, Database db) {
    if (habit == null) {
      return;
    }

    var item = HabitItemsUtility.getHabitDayItemByDate(habit!, date);

    if (item == null) {
      db.addHabitDayItem(HabitDayItemCompanion(
        habitId: Value(habit!.habit.id),
        date: Value(date),
        value: Value(newValue)
      ));
    } else {
      db.updateHabitDayItemValue(item, newValue);
    }
  }
}