import 'package:drift/drift.dart';
import 'package:habitstreaks/models/habit.dart';

@DataClassName("HabitDayItem", companion: "HabitDayItemCompanion")
class HabitDayItemsTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get habitId => integer().references(HabitsTable, #id)();
  DateTimeColumn get date => dateTime()();
  IntColumn get value => integer()();
}