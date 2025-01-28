import 'package:habitstreaks/models/habit.dart';
import 'package:test/test.dart';

void main() {
  group("Testing Frequency class", () {
    test("DailyFrequency : test isScheduledAt method for random date", () {
      final frequency = DailyFrequency();

      expect(frequency.isScheduledAt(DateTime.now()), true);
    });
    test("DailyFrequency : test toString method", () {
      final frequency = DailyFrequency();

      expect(frequency.toString(), "DAILY");
    });
    test("Frequency: test global fromString() method with Daily frequency", () {
      expect(Frequency.fromString("DAILY"), DailyFrequency());
      expect(Frequency.fromString("DAILY(aaa)"), DailyFrequency());
    });
    test("Frequency: test global fromString() method with null frequency", () {
      expect(Frequency.fromString("aaaA"), null);
    });
  });
}