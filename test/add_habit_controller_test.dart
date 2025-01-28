import 'package:habitstreaks/controllers/add_habit_dialog_controller.dart';
import 'package:habitstreaks/models/habit.dart';
import 'package:test/test.dart';

void main() {
  group("Testing AddHabitController class", () {
    test("Test getCorrespondingGoalType method", () {
      var controller = AddHabitDialogController();

      expect(controller.getCorrespondingGoalType(), HabitGoalType.boolean);

      controller.updateSelectedRadio(1);
      expect(controller.getCorrespondingGoalType(), HabitGoalType.boolean);

      controller.updateSelectedRadio(2);
      expect(controller.getCorrespondingGoalType(), HabitGoalType.duration);

      controller.updateSelectedRadio(3);
      expect(controller.getCorrespondingGoalType(), HabitGoalType.number);

      controller.updateSelectedRadio(-111);
      expect(controller.getCorrespondingGoalType(), HabitGoalType.boolean);
    });

    test("Test update method and field checks", () {
      var controller = AddHabitDialogController();
      
      controller.nameController.text = "AAa";
      controller.update();
      expect(controller.isNameValid, true);
      
      controller.nameController.text = "";
      controller.update();
      expect(controller.isNameValid, false);
      
      controller.repsController.text = "12";
      controller.update();
      expect(controller.isRepsValid, true);
      
      controller.repsController.text = "0";
      controller.update();
      expect(controller.isRepsValid, false);
      
      controller.durationController.text = "12:56";
      controller.update();
      expect(controller.isDurationValid, true);
      
      controller.durationController.text = "24";
      controller.update();
      expect(controller.isDurationValid, false);
    });
    
    test("Test toHabit method : valid habit", () {
      var controller = AddHabitDialogController();

      controller.nameController.text = "aaa";
      controller.updateSelectedRadio(2);
      controller.durationController.text = "01";
      controller.repsController.text = "aaa";

      var habit = controller.toHabit();

      expect(habit?.name.value, "aaa");
      expect(habit?.goalType.value, HabitGoalType.duration);
      expect(habit?.goalFormatted.value, 60);
      expect(habit?.frequency.value, DailyFrequency());
      expect(habit?.color.value, HabitColorType.blue);
    });
    
    test("Test toHabit method : invalid habit", () {
      var controller = AddHabitDialogController();

      controller.nameController.text = "aaa";
      controller.updateSelectedRadio(3);
      controller.durationController.text = "01";
      controller.repsController.text = "aaa";

      expect(controller.toHabit(), null);
    });
  });
}