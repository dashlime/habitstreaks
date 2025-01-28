import 'package:habitstreaks/controllers/habit_items_utility.dart';
import 'package:habitstreaks/models/habit.dart';
import 'package:habitstreaks/services/database.dart';
import 'package:test/test.dart';

void main() {
  group("Testing HabitItemUtility class", () {
    test("DateOnlyCompare : test isSameDate method", () {
      expect(DateTime(1990, 1, 1, 6, 20, 1).isSameDate(DateTime(1990, 1, 1)), true);
      expect(DateTime.now().isSameDate(DateTime.now().copyWith(hour: 4)), true);
      expect(DateTime(1990, 1, 2, 6, 20, 1).isSameDate(DateTime(1990, 1, 1)), false);
    });
    test("HabitItemsUtility : test getHabitDayItemByDate, getHabitDayItemScore, getOldestHabitDayItem method", () {
      var habit = HabitWithItems(
        habit: Habit(id: 0, name: "", goalType: HabitGoalType.duration, goalFormatted: 60, frequency: DailyFrequency(), color: HabitColorType.blue), 
        items: [
          HabitDayItem(id: 0, habitId: 0, date: DateTime.now().add(Duration(days: -3)), value: 3),
          HabitDayItem(id: 0, habitId: 0, date: DateTime.now(), value: 1),
          HabitDayItem(id: 0, habitId: 0, date: DateTime.now().add(Duration(days: -1)), value: 2)
        ]
      );

      expect(HabitItemsUtility.getHabitDayItemByDate(habit, DateTime.now().add(Duration(days: -3)))?.value, 3);
      expect(HabitItemsUtility.getHabitDayItemByDate(habit, DateTime.now().add(Duration(days: -2))), null);

      expect(HabitItemsUtility.getHabitDayItemScore(habit, DateTime.now().add(Duration(days: -1))), 2 / 60);
      expect(HabitItemsUtility.getHabitDayItemScore(habit, DateTime.now().add(Duration(days: -2))), 0);

      expect(HabitItemsUtility.getOldestHabitDayItem(habit.items)?.value, 3);
      expect(HabitItemsUtility.getOldestHabitDayItem(List.empty()), null);
    });
  });
}