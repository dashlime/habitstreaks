import 'package:equatable/equatable.dart';
import 'package:drift/drift.dart';
import 'package:habitstreaks/services/database.dart';
import 'package:habitstreaks/services/type_converters.dart';

enum HabitGoalType { 
  boolean,
  duration, 
  number;
}
enum HabitColorType {
  blue;
}

abstract class Frequency extends Equatable {
  bool isScheduledAt(DateTime date);
  @override String toString();

  static Frequency? fromString(String s) {
    if (s.contains(DailyFrequency.key)) {
      return DailyFrequency();
    }

    return null;
  }
}

class DailyFrequency extends Frequency {
  static const String key = "DAILY";

  @override
  bool isScheduledAt(DateTime date) {
    return true;
  }

  @override String toString() {
    return key;
  }

  @override
  List<Object?> get props => List.empty();
}

class HabitWithItems {
  final Habit habit;
  final List<HabitDayItem> items;

  HabitWithItems({
    required this.habit,
    required this.items,
  });
}

@DataClassName("Habit", companion: "HabitCompanion")
class HabitsTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  TextColumn get goalType => textEnum<HabitGoalType>()();
  IntColumn get goalFormatted => integer()();
  TextColumn get frequency => text().map(const FrequencyConverter())();
  TextColumn get color => textEnum<HabitColorType>()();
}