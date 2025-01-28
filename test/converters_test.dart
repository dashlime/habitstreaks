import 'package:habitstreaks/view/utilities/converters.dart';
import 'package:test/test.dart';

void main() {
  group("Testing Converters class", () {
    test("Converters : test durationToText method", () {
      expect(Converters.durationToText(72), "01:12");
      expect(Converters.durationToText(2), "00:02");
      expect(Converters.durationToText(90), "01:30");
    });
  });
}