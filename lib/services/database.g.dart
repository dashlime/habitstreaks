// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $HabitsTableTable extends HabitsTable
    with TableInfo<$HabitsTableTable, Habit> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $HabitsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _goalTypeMeta =
      const VerificationMeta('goalType');
  @override
  late final GeneratedColumnWithTypeConverter<HabitGoalType, String> goalType =
      GeneratedColumn<String>('goal_type', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<HabitGoalType>($HabitsTableTable.$convertergoalType);
  static const VerificationMeta _goalFormattedMeta =
      const VerificationMeta('goalFormatted');
  @override
  late final GeneratedColumn<int> goalFormatted = GeneratedColumn<int>(
      'goal_formatted', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _frequencyMeta =
      const VerificationMeta('frequency');
  @override
  late final GeneratedColumnWithTypeConverter<Frequency, String> frequency =
      GeneratedColumn<String>('frequency', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<Frequency>($HabitsTableTable.$converterfrequency);
  static const VerificationMeta _colorMeta = const VerificationMeta('color');
  @override
  late final GeneratedColumnWithTypeConverter<HabitColorType, String> color =
      GeneratedColumn<String>('color', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<HabitColorType>($HabitsTableTable.$convertercolor);
  @override
  List<GeneratedColumn> get $columns =>
      [id, name, goalType, goalFormatted, frequency, color];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'habits_table';
  @override
  VerificationContext validateIntegrity(Insertable<Habit> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    context.handle(_goalTypeMeta, const VerificationResult.success());
    if (data.containsKey('goal_formatted')) {
      context.handle(
          _goalFormattedMeta,
          goalFormatted.isAcceptableOrUnknown(
              data['goal_formatted']!, _goalFormattedMeta));
    } else if (isInserting) {
      context.missing(_goalFormattedMeta);
    }
    context.handle(_frequencyMeta, const VerificationResult.success());
    context.handle(_colorMeta, const VerificationResult.success());
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Habit map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Habit(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      goalType: $HabitsTableTable.$convertergoalType.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}goal_type'])!),
      goalFormatted: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}goal_formatted'])!,
      frequency: $HabitsTableTable.$converterfrequency.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}frequency'])!),
      color: $HabitsTableTable.$convertercolor.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}color'])!),
    );
  }

  @override
  $HabitsTableTable createAlias(String alias) {
    return $HabitsTableTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<HabitGoalType, String, String> $convertergoalType =
      const EnumNameConverter<HabitGoalType>(HabitGoalType.values);
  static TypeConverter<Frequency, String> $converterfrequency =
      const FrequencyConverter();
  static JsonTypeConverter2<HabitColorType, String, String> $convertercolor =
      const EnumNameConverter<HabitColorType>(HabitColorType.values);
}

class Habit extends DataClass implements Insertable<Habit> {
  final int id;
  final String name;
  final HabitGoalType goalType;
  final int goalFormatted;
  final Frequency frequency;
  final HabitColorType color;
  const Habit(
      {required this.id,
      required this.name,
      required this.goalType,
      required this.goalFormatted,
      required this.frequency,
      required this.color});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    {
      map['goal_type'] = Variable<String>(
          $HabitsTableTable.$convertergoalType.toSql(goalType));
    }
    map['goal_formatted'] = Variable<int>(goalFormatted);
    {
      map['frequency'] = Variable<String>(
          $HabitsTableTable.$converterfrequency.toSql(frequency));
    }
    {
      map['color'] =
          Variable<String>($HabitsTableTable.$convertercolor.toSql(color));
    }
    return map;
  }

  HabitCompanion toCompanion(bool nullToAbsent) {
    return HabitCompanion(
      id: Value(id),
      name: Value(name),
      goalType: Value(goalType),
      goalFormatted: Value(goalFormatted),
      frequency: Value(frequency),
      color: Value(color),
    );
  }

  factory Habit.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Habit(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      goalType: $HabitsTableTable.$convertergoalType
          .fromJson(serializer.fromJson<String>(json['goalType'])),
      goalFormatted: serializer.fromJson<int>(json['goalFormatted']),
      frequency: serializer.fromJson<Frequency>(json['frequency']),
      color: $HabitsTableTable.$convertercolor
          .fromJson(serializer.fromJson<String>(json['color'])),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'goalType': serializer.toJson<String>(
          $HabitsTableTable.$convertergoalType.toJson(goalType)),
      'goalFormatted': serializer.toJson<int>(goalFormatted),
      'frequency': serializer.toJson<Frequency>(frequency),
      'color': serializer
          .toJson<String>($HabitsTableTable.$convertercolor.toJson(color)),
    };
  }

  Habit copyWith(
          {int? id,
          String? name,
          HabitGoalType? goalType,
          int? goalFormatted,
          Frequency? frequency,
          HabitColorType? color}) =>
      Habit(
        id: id ?? this.id,
        name: name ?? this.name,
        goalType: goalType ?? this.goalType,
        goalFormatted: goalFormatted ?? this.goalFormatted,
        frequency: frequency ?? this.frequency,
        color: color ?? this.color,
      );
  Habit copyWithCompanion(HabitCompanion data) {
    return Habit(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      goalType: data.goalType.present ? data.goalType.value : this.goalType,
      goalFormatted: data.goalFormatted.present
          ? data.goalFormatted.value
          : this.goalFormatted,
      frequency: data.frequency.present ? data.frequency.value : this.frequency,
      color: data.color.present ? data.color.value : this.color,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Habit(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('goalType: $goalType, ')
          ..write('goalFormatted: $goalFormatted, ')
          ..write('frequency: $frequency, ')
          ..write('color: $color')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, name, goalType, goalFormatted, frequency, color);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Habit &&
          other.id == this.id &&
          other.name == this.name &&
          other.goalType == this.goalType &&
          other.goalFormatted == this.goalFormatted &&
          other.frequency == this.frequency &&
          other.color == this.color);
}

class HabitCompanion extends UpdateCompanion<Habit> {
  final Value<int> id;
  final Value<String> name;
  final Value<HabitGoalType> goalType;
  final Value<int> goalFormatted;
  final Value<Frequency> frequency;
  final Value<HabitColorType> color;
  const HabitCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.goalType = const Value.absent(),
    this.goalFormatted = const Value.absent(),
    this.frequency = const Value.absent(),
    this.color = const Value.absent(),
  });
  HabitCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required HabitGoalType goalType,
    required int goalFormatted,
    required Frequency frequency,
    required HabitColorType color,
  })  : name = Value(name),
        goalType = Value(goalType),
        goalFormatted = Value(goalFormatted),
        frequency = Value(frequency),
        color = Value(color);
  static Insertable<Habit> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? goalType,
    Expression<int>? goalFormatted,
    Expression<String>? frequency,
    Expression<String>? color,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (goalType != null) 'goal_type': goalType,
      if (goalFormatted != null) 'goal_formatted': goalFormatted,
      if (frequency != null) 'frequency': frequency,
      if (color != null) 'color': color,
    });
  }

  HabitCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<HabitGoalType>? goalType,
      Value<int>? goalFormatted,
      Value<Frequency>? frequency,
      Value<HabitColorType>? color}) {
    return HabitCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      goalType: goalType ?? this.goalType,
      goalFormatted: goalFormatted ?? this.goalFormatted,
      frequency: frequency ?? this.frequency,
      color: color ?? this.color,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (goalType.present) {
      map['goal_type'] = Variable<String>(
          $HabitsTableTable.$convertergoalType.toSql(goalType.value));
    }
    if (goalFormatted.present) {
      map['goal_formatted'] = Variable<int>(goalFormatted.value);
    }
    if (frequency.present) {
      map['frequency'] = Variable<String>(
          $HabitsTableTable.$converterfrequency.toSql(frequency.value));
    }
    if (color.present) {
      map['color'] = Variable<String>(
          $HabitsTableTable.$convertercolor.toSql(color.value));
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('HabitCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('goalType: $goalType, ')
          ..write('goalFormatted: $goalFormatted, ')
          ..write('frequency: $frequency, ')
          ..write('color: $color')
          ..write(')'))
        .toString();
  }
}

class $HabitDayItemsTableTable extends HabitDayItemsTable
    with TableInfo<$HabitDayItemsTableTable, HabitDayItem> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $HabitDayItemsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _habitIdMeta =
      const VerificationMeta('habitId');
  @override
  late final GeneratedColumn<int> habitId = GeneratedColumn<int>(
      'habit_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES habits_table (id)'));
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
      'date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _valueMeta = const VerificationMeta('value');
  @override
  late final GeneratedColumn<int> value = GeneratedColumn<int>(
      'value', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, habitId, date, value];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'habit_day_items_table';
  @override
  VerificationContext validateIntegrity(Insertable<HabitDayItem> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('habit_id')) {
      context.handle(_habitIdMeta,
          habitId.isAcceptableOrUnknown(data['habit_id']!, _habitIdMeta));
    } else if (isInserting) {
      context.missing(_habitIdMeta);
    }
    if (data.containsKey('date')) {
      context.handle(
          _dateMeta, date.isAcceptableOrUnknown(data['date']!, _dateMeta));
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('value')) {
      context.handle(
          _valueMeta, value.isAcceptableOrUnknown(data['value']!, _valueMeta));
    } else if (isInserting) {
      context.missing(_valueMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  HabitDayItem map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return HabitDayItem(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      habitId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}habit_id'])!,
      date: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}date'])!,
      value: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}value'])!,
    );
  }

  @override
  $HabitDayItemsTableTable createAlias(String alias) {
    return $HabitDayItemsTableTable(attachedDatabase, alias);
  }
}

class HabitDayItem extends DataClass implements Insertable<HabitDayItem> {
  final int id;
  final int habitId;
  final DateTime date;
  final int value;
  const HabitDayItem(
      {required this.id,
      required this.habitId,
      required this.date,
      required this.value});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['habit_id'] = Variable<int>(habitId);
    map['date'] = Variable<DateTime>(date);
    map['value'] = Variable<int>(value);
    return map;
  }

  HabitDayItemCompanion toCompanion(bool nullToAbsent) {
    return HabitDayItemCompanion(
      id: Value(id),
      habitId: Value(habitId),
      date: Value(date),
      value: Value(value),
    );
  }

  factory HabitDayItem.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return HabitDayItem(
      id: serializer.fromJson<int>(json['id']),
      habitId: serializer.fromJson<int>(json['habitId']),
      date: serializer.fromJson<DateTime>(json['date']),
      value: serializer.fromJson<int>(json['value']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'habitId': serializer.toJson<int>(habitId),
      'date': serializer.toJson<DateTime>(date),
      'value': serializer.toJson<int>(value),
    };
  }

  HabitDayItem copyWith({int? id, int? habitId, DateTime? date, int? value}) =>
      HabitDayItem(
        id: id ?? this.id,
        habitId: habitId ?? this.habitId,
        date: date ?? this.date,
        value: value ?? this.value,
      );
  HabitDayItem copyWithCompanion(HabitDayItemCompanion data) {
    return HabitDayItem(
      id: data.id.present ? data.id.value : this.id,
      habitId: data.habitId.present ? data.habitId.value : this.habitId,
      date: data.date.present ? data.date.value : this.date,
      value: data.value.present ? data.value.value : this.value,
    );
  }

  @override
  String toString() {
    return (StringBuffer('HabitDayItem(')
          ..write('id: $id, ')
          ..write('habitId: $habitId, ')
          ..write('date: $date, ')
          ..write('value: $value')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, habitId, date, value);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is HabitDayItem &&
          other.id == this.id &&
          other.habitId == this.habitId &&
          other.date == this.date &&
          other.value == this.value);
}

class HabitDayItemCompanion extends UpdateCompanion<HabitDayItem> {
  final Value<int> id;
  final Value<int> habitId;
  final Value<DateTime> date;
  final Value<int> value;
  const HabitDayItemCompanion({
    this.id = const Value.absent(),
    this.habitId = const Value.absent(),
    this.date = const Value.absent(),
    this.value = const Value.absent(),
  });
  HabitDayItemCompanion.insert({
    this.id = const Value.absent(),
    required int habitId,
    required DateTime date,
    required int value,
  })  : habitId = Value(habitId),
        date = Value(date),
        value = Value(value);
  static Insertable<HabitDayItem> custom({
    Expression<int>? id,
    Expression<int>? habitId,
    Expression<DateTime>? date,
    Expression<int>? value,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (habitId != null) 'habit_id': habitId,
      if (date != null) 'date': date,
      if (value != null) 'value': value,
    });
  }

  HabitDayItemCompanion copyWith(
      {Value<int>? id,
      Value<int>? habitId,
      Value<DateTime>? date,
      Value<int>? value}) {
    return HabitDayItemCompanion(
      id: id ?? this.id,
      habitId: habitId ?? this.habitId,
      date: date ?? this.date,
      value: value ?? this.value,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (habitId.present) {
      map['habit_id'] = Variable<int>(habitId.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (value.present) {
      map['value'] = Variable<int>(value.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('HabitDayItemCompanion(')
          ..write('id: $id, ')
          ..write('habitId: $habitId, ')
          ..write('date: $date, ')
          ..write('value: $value')
          ..write(')'))
        .toString();
  }
}

abstract class _$Database extends GeneratedDatabase {
  _$Database(QueryExecutor e) : super(e);
  $DatabaseManager get managers => $DatabaseManager(this);
  late final $HabitsTableTable habitsTable = $HabitsTableTable(this);
  late final $HabitDayItemsTableTable habitDayItemsTable =
      $HabitDayItemsTableTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [habitsTable, habitDayItemsTable];
}

typedef $$HabitsTableTableCreateCompanionBuilder = HabitCompanion Function({
  Value<int> id,
  required String name,
  required HabitGoalType goalType,
  required int goalFormatted,
  required Frequency frequency,
  required HabitColorType color,
});
typedef $$HabitsTableTableUpdateCompanionBuilder = HabitCompanion Function({
  Value<int> id,
  Value<String> name,
  Value<HabitGoalType> goalType,
  Value<int> goalFormatted,
  Value<Frequency> frequency,
  Value<HabitColorType> color,
});

final class $$HabitsTableTableReferences
    extends BaseReferences<_$Database, $HabitsTableTable, Habit> {
  $$HabitsTableTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$HabitDayItemsTableTable, List<HabitDayItem>>
      _habitDayItemsTableRefsTable(_$Database db) =>
          MultiTypedResultKey.fromTable(db.habitDayItemsTable,
              aliasName: $_aliasNameGenerator(
                  db.habitsTable.id, db.habitDayItemsTable.habitId));

  $$HabitDayItemsTableTableProcessedTableManager get habitDayItemsTableRefs {
    final manager =
        $$HabitDayItemsTableTableTableManager($_db, $_db.habitDayItemsTable)
            .filter((f) => f.habitId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache =
        $_typedResult.readTableOrNull(_habitDayItemsTableRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$HabitsTableTableFilterComposer
    extends Composer<_$Database, $HabitsTableTable> {
  $$HabitsTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnWithTypeConverterFilters<HabitGoalType, HabitGoalType, String>
      get goalType => $composableBuilder(
          column: $table.goalType,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnFilters<int> get goalFormatted => $composableBuilder(
      column: $table.goalFormatted, builder: (column) => ColumnFilters(column));

  ColumnWithTypeConverterFilters<Frequency, Frequency, String> get frequency =>
      $composableBuilder(
          column: $table.frequency,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnWithTypeConverterFilters<HabitColorType, HabitColorType, String>
      get color => $composableBuilder(
          column: $table.color,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  Expression<bool> habitDayItemsTableRefs(
      Expression<bool> Function($$HabitDayItemsTableTableFilterComposer f) f) {
    final $$HabitDayItemsTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.habitDayItemsTable,
        getReferencedColumn: (t) => t.habitId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$HabitDayItemsTableTableFilterComposer(
              $db: $db,
              $table: $db.habitDayItemsTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$HabitsTableTableOrderingComposer
    extends Composer<_$Database, $HabitsTableTable> {
  $$HabitsTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get goalType => $composableBuilder(
      column: $table.goalType, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get goalFormatted => $composableBuilder(
      column: $table.goalFormatted,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get frequency => $composableBuilder(
      column: $table.frequency, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get color => $composableBuilder(
      column: $table.color, builder: (column) => ColumnOrderings(column));
}

class $$HabitsTableTableAnnotationComposer
    extends Composer<_$Database, $HabitsTableTable> {
  $$HabitsTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumnWithTypeConverter<HabitGoalType, String> get goalType =>
      $composableBuilder(column: $table.goalType, builder: (column) => column);

  GeneratedColumn<int> get goalFormatted => $composableBuilder(
      column: $table.goalFormatted, builder: (column) => column);

  GeneratedColumnWithTypeConverter<Frequency, String> get frequency =>
      $composableBuilder(column: $table.frequency, builder: (column) => column);

  GeneratedColumnWithTypeConverter<HabitColorType, String> get color =>
      $composableBuilder(column: $table.color, builder: (column) => column);

  Expression<T> habitDayItemsTableRefs<T extends Object>(
      Expression<T> Function($$HabitDayItemsTableTableAnnotationComposer a) f) {
    final $$HabitDayItemsTableTableAnnotationComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $db.habitDayItemsTable,
            getReferencedColumn: (t) => t.habitId,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$HabitDayItemsTableTableAnnotationComposer(
                  $db: $db,
                  $table: $db.habitDayItemsTable,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return f(composer);
  }
}

class $$HabitsTableTableTableManager extends RootTableManager<
    _$Database,
    $HabitsTableTable,
    Habit,
    $$HabitsTableTableFilterComposer,
    $$HabitsTableTableOrderingComposer,
    $$HabitsTableTableAnnotationComposer,
    $$HabitsTableTableCreateCompanionBuilder,
    $$HabitsTableTableUpdateCompanionBuilder,
    (Habit, $$HabitsTableTableReferences),
    Habit,
    PrefetchHooks Function({bool habitDayItemsTableRefs})> {
  $$HabitsTableTableTableManager(_$Database db, $HabitsTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$HabitsTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$HabitsTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$HabitsTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<HabitGoalType> goalType = const Value.absent(),
            Value<int> goalFormatted = const Value.absent(),
            Value<Frequency> frequency = const Value.absent(),
            Value<HabitColorType> color = const Value.absent(),
          }) =>
              HabitCompanion(
            id: id,
            name: name,
            goalType: goalType,
            goalFormatted: goalFormatted,
            frequency: frequency,
            color: color,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String name,
            required HabitGoalType goalType,
            required int goalFormatted,
            required Frequency frequency,
            required HabitColorType color,
          }) =>
              HabitCompanion.insert(
            id: id,
            name: name,
            goalType: goalType,
            goalFormatted: goalFormatted,
            frequency: frequency,
            color: color,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$HabitsTableTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({habitDayItemsTableRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (habitDayItemsTableRefs) db.habitDayItemsTable
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (habitDayItemsTableRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable: $$HabitsTableTableReferences
                            ._habitDayItemsTableRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$HabitsTableTableReferences(db, table, p0)
                                .habitDayItemsTableRefs,
                        referencedItemsForCurrentItem: (item,
                                referencedItems) =>
                            referencedItems.where((e) => e.habitId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$HabitsTableTableProcessedTableManager = ProcessedTableManager<
    _$Database,
    $HabitsTableTable,
    Habit,
    $$HabitsTableTableFilterComposer,
    $$HabitsTableTableOrderingComposer,
    $$HabitsTableTableAnnotationComposer,
    $$HabitsTableTableCreateCompanionBuilder,
    $$HabitsTableTableUpdateCompanionBuilder,
    (Habit, $$HabitsTableTableReferences),
    Habit,
    PrefetchHooks Function({bool habitDayItemsTableRefs})>;
typedef $$HabitDayItemsTableTableCreateCompanionBuilder = HabitDayItemCompanion
    Function({
  Value<int> id,
  required int habitId,
  required DateTime date,
  required int value,
});
typedef $$HabitDayItemsTableTableUpdateCompanionBuilder = HabitDayItemCompanion
    Function({
  Value<int> id,
  Value<int> habitId,
  Value<DateTime> date,
  Value<int> value,
});

final class $$HabitDayItemsTableTableReferences
    extends BaseReferences<_$Database, $HabitDayItemsTableTable, HabitDayItem> {
  $$HabitDayItemsTableTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $HabitsTableTable _habitIdTable(_$Database db) =>
      db.habitsTable.createAlias($_aliasNameGenerator(
          db.habitDayItemsTable.habitId, db.habitsTable.id));

  $$HabitsTableTableProcessedTableManager get habitId {
    final $_column = $_itemColumn<int>('habit_id')!;

    final manager = $$HabitsTableTableTableManager($_db, $_db.habitsTable)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_habitIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$HabitDayItemsTableTableFilterComposer
    extends Composer<_$Database, $HabitDayItemsTableTable> {
  $$HabitDayItemsTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get date => $composableBuilder(
      column: $table.date, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get value => $composableBuilder(
      column: $table.value, builder: (column) => ColumnFilters(column));

  $$HabitsTableTableFilterComposer get habitId {
    final $$HabitsTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.habitId,
        referencedTable: $db.habitsTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$HabitsTableTableFilterComposer(
              $db: $db,
              $table: $db.habitsTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$HabitDayItemsTableTableOrderingComposer
    extends Composer<_$Database, $HabitDayItemsTableTable> {
  $$HabitDayItemsTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get date => $composableBuilder(
      column: $table.date, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get value => $composableBuilder(
      column: $table.value, builder: (column) => ColumnOrderings(column));

  $$HabitsTableTableOrderingComposer get habitId {
    final $$HabitsTableTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.habitId,
        referencedTable: $db.habitsTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$HabitsTableTableOrderingComposer(
              $db: $db,
              $table: $db.habitsTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$HabitDayItemsTableTableAnnotationComposer
    extends Composer<_$Database, $HabitDayItemsTableTable> {
  $$HabitDayItemsTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  GeneratedColumn<int> get value =>
      $composableBuilder(column: $table.value, builder: (column) => column);

  $$HabitsTableTableAnnotationComposer get habitId {
    final $$HabitsTableTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.habitId,
        referencedTable: $db.habitsTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$HabitsTableTableAnnotationComposer(
              $db: $db,
              $table: $db.habitsTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$HabitDayItemsTableTableTableManager extends RootTableManager<
    _$Database,
    $HabitDayItemsTableTable,
    HabitDayItem,
    $$HabitDayItemsTableTableFilterComposer,
    $$HabitDayItemsTableTableOrderingComposer,
    $$HabitDayItemsTableTableAnnotationComposer,
    $$HabitDayItemsTableTableCreateCompanionBuilder,
    $$HabitDayItemsTableTableUpdateCompanionBuilder,
    (HabitDayItem, $$HabitDayItemsTableTableReferences),
    HabitDayItem,
    PrefetchHooks Function({bool habitId})> {
  $$HabitDayItemsTableTableTableManager(
      _$Database db, $HabitDayItemsTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$HabitDayItemsTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$HabitDayItemsTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$HabitDayItemsTableTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> habitId = const Value.absent(),
            Value<DateTime> date = const Value.absent(),
            Value<int> value = const Value.absent(),
          }) =>
              HabitDayItemCompanion(
            id: id,
            habitId: habitId,
            date: date,
            value: value,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int habitId,
            required DateTime date,
            required int value,
          }) =>
              HabitDayItemCompanion.insert(
            id: id,
            habitId: habitId,
            date: date,
            value: value,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$HabitDayItemsTableTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({habitId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (habitId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.habitId,
                    referencedTable:
                        $$HabitDayItemsTableTableReferences._habitIdTable(db),
                    referencedColumn: $$HabitDayItemsTableTableReferences
                        ._habitIdTable(db)
                        .id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$HabitDayItemsTableTableProcessedTableManager = ProcessedTableManager<
    _$Database,
    $HabitDayItemsTableTable,
    HabitDayItem,
    $$HabitDayItemsTableTableFilterComposer,
    $$HabitDayItemsTableTableOrderingComposer,
    $$HabitDayItemsTableTableAnnotationComposer,
    $$HabitDayItemsTableTableCreateCompanionBuilder,
    $$HabitDayItemsTableTableUpdateCompanionBuilder,
    (HabitDayItem, $$HabitDayItemsTableTableReferences),
    HabitDayItem,
    PrefetchHooks Function({bool habitId})>;

class $DatabaseManager {
  final _$Database _db;
  $DatabaseManager(this._db);
  $$HabitsTableTableTableManager get habitsTable =>
      $$HabitsTableTableTableManager(_db, _db.habitsTable);
  $$HabitDayItemsTableTableTableManager get habitDayItemsTable =>
      $$HabitDayItemsTableTableTableManager(_db, _db.habitDayItemsTable);
}
