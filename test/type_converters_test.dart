import 'package:habitstreaks/models/habit.dart';
import 'package:habitstreaks/services/type_converters.dart';
import 'package:test/test.dart';

void main() {
  group("Testing Frequency Type Converter class", () {
    test("Incorrect string : test fromSql method", () {
      expect(FrequencyConverter().fromSql("aaAA"), DailyFrequency());
    });
    test("DailyFrequency : test toSql method", () {
      var frequency = DailyFrequency();

      expect(FrequencyConverter().toSql(frequency), "DAILY");
    });
    test("DailyFrequency : test fromSql method", () {
      expect(FrequencyConverter().fromSql("DAILY"), DailyFrequency());
    });
  });
}