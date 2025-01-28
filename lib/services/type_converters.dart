import 'package:drift/drift.dart';
import 'package:habitstreaks/models/habit.dart';

class FrequencyConverter extends TypeConverter<Frequency, String> {
  const FrequencyConverter();

  @override
  Frequency fromSql(String fromDb) {
    var frequency = Frequency.fromString(fromDb);

    return frequency ?? DailyFrequency();
  }

  @override
  String toSql(Frequency value) {
    return value.toString();
  }
}