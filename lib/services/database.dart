import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:habitstreaks/models/habit.dart';
import 'package:habitstreaks/models/habit_day_item.dart';
import 'package:habitstreaks/services/type_converters.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

part 'database.g.dart';

@DriftDatabase(
  tables: [
    HabitsTable,
    HabitDayItemsTable
  ]
)
class Database extends _$Database {
  Database() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  Future<int> addHabitDayItem(HabitDayItemCompanion item) {
    return into(habitDayItemsTable).insert(item);
  }

  Future<int> addHabit(HabitCompanion habit) {
    return into(habitsTable).insert(habit);
  }

  Future updateHabitDayItemValue(HabitDayItem item, int newValue) {
    return (update(habitDayItemsTable)..where((i) => i.id.equals(item.id))).write(HabitDayItemCompanion(value: Value(newValue)));
  }

  Stream<List<HabitWithItems>> watchAllHabits() {
    final query = select(habitsTable).join(
      [
        leftOuterJoin(habitDayItemsTable, habitDayItemsTable.habitId.equalsExp(habitsTable.id)),
      ],
    );

    return query.watch().map((rows) {
      // Group the results into HabitWithItems
      final Map<int, HabitWithItems> habitMap = {};

      for (final row in rows) {
        final habit = row.readTable(habitsTable);
        final item = row.readTableOrNull(habitDayItemsTable);

        // Add to the map of HabitWithItems
        if (habitMap.containsKey(habit.id)) {
          habitMap[habit.id]!.items.add(item!);
        } else {
          habitMap[habit.id] = HabitWithItems(
            habit: habit,
            items: item != null ? [item] : [],
          );
        }
      }

      // Return all HabitWithItems objects
      return habitMap.values.toList();
    });
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(join(dbFolder.path, 'db.sqlite'));

    return NativeDatabase.createInBackground(file);
  });
}