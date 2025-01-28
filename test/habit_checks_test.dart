import 'package:habitstreaks/controllers/input_checks.dart';
import 'package:test/test.dart';

void main() {
  group("Testing Habit Checks class", () {
    test("Test checkHabitName method", () {
      expect(InputChecks.checkHabitName(""), null);
      expect(InputChecks.checkHabitName("AA"), "AA");
    });

    test("Test checkDurationText method", () {
      expect(InputChecks.checkDurationText("1a:aa"), null);
      expect(InputChecks.checkDurationText("1.2"), null);
      expect(InputChecks.checkDurationText("1,2"), null);
      expect(InputChecks.checkDurationText("-2"), null);
      expect(InputChecks.checkDurationText(""), 0);
      expect(InputChecks.checkDurationText("00:00"), 0);
      expect(InputChecks.checkDurationText("12"), 12*60);
      expect(InputChecks.checkDurationText("12:1"), 12*60 + 10);
      expect(InputChecks.checkDurationText("12:12"), 12*60 + 12);
      expect(InputChecks.checkDurationText("24:12"), null);
      expect(InputChecks.checkDurationText("23:59"), 23*60 + 59);
      expect(InputChecks.checkDurationText("24:00"), null);
      expect(InputChecks.checkDurationText("12:60"), null);
      expect(InputChecks.checkDurationText("12:9"), null);
    });

    test("Test checkGoalDurationText method", () {
      expect(InputChecks.checkGoalDurationText("00:00"), null);
      expect(InputChecks.checkGoalDurationText("12:1"), 12*60 + 10);
    });

    test("Test checkRepsNumberText method", () {
      expect(InputChecks.checkRepsNumberText("1aaa"), null);
      expect(InputChecks.checkRepsNumberText("1.2"), null);
      expect(InputChecks.checkRepsNumberText("1,2"), null);
      expect(InputChecks.checkRepsNumberText("-2"), null);
      expect(InputChecks.checkRepsNumberText("5"), 5);
      expect(InputChecks.checkRepsNumberText("1"), 1);
      expect(InputChecks.checkRepsNumberText("0"), 0);
    });

    test("Test checkGoalRepsNumberText method", () {
      expect(InputChecks.checkGoalRepsNumberText("5"), 5);
      expect(InputChecks.checkGoalRepsNumberText("0"), null);
    });
  });
}