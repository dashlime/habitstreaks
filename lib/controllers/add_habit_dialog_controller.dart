import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:habitstreaks/controllers/input_checks.dart';
import 'package:habitstreaks/models/habit.dart';
import 'package:habitstreaks/services/database.dart';

class AddHabitDialogController {
  int selectedRadio = 1;
  TextEditingController nameController = TextEditingController();
  TextEditingController durationController = TextEditingController(text: "00:10");
  TextEditingController repsController = TextEditingController(text: "1");

  bool isNameValid = true;
  bool isDurationValid = true;
  bool isRepsValid = true;

  void updateSelectedRadio(int newValue) {
    selectedRadio = newValue;
    update();
  }

  @visibleForTesting
  HabitGoalType getCorrespondingGoalType() {
    switch (selectedRadio) {
      case 1: return HabitGoalType.boolean;
      case 2: return HabitGoalType.duration;
      case 3: return HabitGoalType.number;
    }

    return HabitGoalType.boolean;
  }

  void update() {
    isNameValid = InputChecks.checkHabitName(nameController.text) != null;
    isDurationValid = InputChecks.checkGoalDurationText(durationController.text) != null;
    isRepsValid = InputChecks.checkGoalRepsNumberText(repsController.text) != null;
  }

  bool saveToDatabase(Database db) {
    var habit = toHabit();

    if (habit == null) {
      return false;
    }

    db.addHabit(habit);

    return true;
  }

  @visibleForTesting
  HabitCompanion? toHabit() {
    update();

    var name = InputChecks.checkHabitName(nameController.text);
    var goalType = getCorrespondingGoalType();
    var durationGoal = InputChecks.checkGoalDurationText(durationController.text);
    var repsGoal = InputChecks.checkGoalRepsNumberText(repsController.text);

    if (name == null) {
      return null;
    }

    int? goalFormatted = switch (goalType) {
      HabitGoalType.boolean => 1,
      HabitGoalType.duration => durationGoal,
      HabitGoalType.number => repsGoal
    };

    if (goalFormatted == null) {
      return null;
    }

    HabitCompanion habit = HabitCompanion(
      name: Value(name),
      goalType: Value(goalType),
      goalFormatted: Value(goalFormatted),
      frequency: Value(DailyFrequency()),
      color: const Value(HabitColorType.blue));

    return habit;
  }
}
