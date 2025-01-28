import 'package:flutter/material.dart';
import 'package:habitstreaks/controllers/habit_box_controller.dart';
import 'package:habitstreaks/main.dart';
import 'package:habitstreaks/models/habit.dart';
import 'package:habitstreaks/controllers/habit_items_utility.dart';
import 'package:habitstreaks/view/dialogs/update_duration_dialog.dart';
import 'package:habitstreaks/view/dialogs/update_reps_dialog.dart';
import 'package:habitstreaks/view/widgets/habit_day_item_widgets.dart';
import 'package:intl/intl.dart';

const int emptyRowsBeforeHabitCreation = 30;

class ScrollableHabitItemsListState extends State<ScrollableHabitItemsList> {
  late final HabitBoxController _habitBoxController;

  @override
  void initState() {
    super.initState();

    _habitBoxController = HabitBoxController(habit: widget.habit);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var firstItemDate = HabitItemsUtility.getOldestHabitDayItem(widget.habit.items)?.date ?? DateTime.now();
    var rowsNumber = DateTime.now().difference(firstItemDate).inDays + emptyRowsBeforeHabitCreation;

    return SizedBox(
      height: 120,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        reverse: true,
        itemCount: rowsNumber,
        itemBuilder: (BuildContext context, int index) {
          var date = DateTime.now().subtract(Duration(days: index));
          var score = HabitItemsUtility.getHabitDayItemScore(widget.habit, date);

          return InkWell(
            onTap: () {
              var value = HabitItemsUtility.getHabitDayItemByDate(widget.habit, date)?.value ?? 0;

              switch (widget.habit.habit.goalType) {
                case HabitGoalType.boolean : _habitBoxController.updateHabitDayItemValue((score == 1) ? 0 : 1, date, database);
                case HabitGoalType.duration :  {
                  showDialog(
                    context: context, 
                    builder: (BuildContext context) { 
                      return UpdateDurationDialog(onValueUpdated: (newValue) { 
                        _habitBoxController.updateHabitDayItemValue(newValue, date, database);
                      }, date: date, initialValue: value);
                    }
                  );
                }
                case HabitGoalType.number : {
                  showDialog(
                    context: context, 
                    builder: (BuildContext context) { 
                      return UpdateRepsDialog(onValueUpdated: (newValue) { 
                        _habitBoxController.updateHabitDayItemValue(newValue, date, database);
                      }, date: date, initialValue: value);
                    }
                  );
                }
              }
            },
            child: SizedBox(
              width: 50,
              child: Column(
                children: [
                  Text(DateFormat.E().format(date).toUpperCase()),
                  Text(date.day.toString()),
                  SizedBox(height: 10),
                  if (score < 1)
                    NotCompletedHabitDayItem(completedRate: score, color: widget.habit.habit.color)
                  else
                    CompletedHabitDayItem(color: widget.habit.habit.color)
                ]
              )
            )
          );
        }
      )
    );
  }
}

class ScrollableHabitItemsList extends StatefulWidget {
  final HabitWithItems habit;

  const ScrollableHabitItemsList({super.key, required this.habit});

  @override
  State<ScrollableHabitItemsList> createState() => ScrollableHabitItemsListState();
}
