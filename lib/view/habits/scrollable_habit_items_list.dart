import 'package:flutter/material.dart';
import 'package:habitstreaks/controllers/habit_box_controller.dart';
import 'package:habitstreaks/main.dart';
import 'package:habitstreaks/models/habit.dart';
import 'package:habitstreaks/services/database.dart';
import 'package:habitstreaks/view/dialogs/update_duration_dialog.dart';
import 'package:habitstreaks/view/dialogs/update_reps_dialog.dart';
import 'package:habitstreaks/view/theme/colors.dart';
import 'package:habitstreaks/view/widgets/habit_day_item_widgets.dart';
import 'package:intl/intl.dart';

class ScrollableHabitItemsListState extends State<ScrollableHabitItemsList> {
  late final HabitBoxController _habitBoxController = HabitBoxController();
  List<HabitDayItem> _itemsList = List.empty();

  @override
  void initState() {
    super.initState();

    _habitBoxController.itemsListController.stream.listen((data) {
      setState(() {
        _itemsList = data;
      });
    });
  }

  @override
  void didUpdateWidget(covariant ScrollableHabitItemsList oldWidget) {
    super.didUpdateWidget(oldWidget);

    _habitBoxController.updateHabit(widget.habit);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _habitBoxController.updateHabit(widget.habit);

    return SizedBox(
      height: 120,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        reverse: true,
        itemCount: _itemsList.length,
        itemBuilder: (BuildContext context, int index) {
          var item = _itemsList.elementAt(index);
          var score = item.value.toDouble() / widget.habit.habit.goalFormatted.toDouble();

          return InkWell(
            onTap: () {
              switch (widget.habit.habit.goalType) {
                case HabitGoalType.boolean : _habitBoxController.updateHabitDayItemValue((item.value == 1) ? 0 : 1, item.date, database);
                case HabitGoalType.duration :  {
                  showDialog(
                    context: context, 
                    builder: (BuildContext context) { 
                      return UpdateDurationDialog(onValueUpdated: (newValue) { 
                        _habitBoxController.updateHabitDayItemValue(newValue, item.date, database);
                      }, date: item.date, initialValue: item.value);
                    }
                  );
                }
                case HabitGoalType.number : {
                  showDialog(
                    context: context, 
                    builder: (BuildContext context) { 
                      return UpdateRepsDialog(onValueUpdated: (newValue) { 
                        _habitBoxController.updateHabitDayItemValue(newValue, item.date, database);
                      }, date: item.date, initialValue: item.value);
                    }
                  );
                }
              }
            },
            child: SizedBox(
              width: 50,
              child: Column(
                children: [
                  Text(DateFormat.E().format(item.date).toUpperCase(), style: Theme.of(context).textTheme.bodySmall?.copyWith(color: UiColors.grayText)),
                  Text(item.date.day.toString(), style: Theme.of(context).textTheme.labelMedium),
                  const SizedBox(height: 10),
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
