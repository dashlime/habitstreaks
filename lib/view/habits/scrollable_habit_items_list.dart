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

const double minimumHabitDayItemWidth = 70;

class ScrollableHabitItemsListState extends State<ScrollableHabitItemsList> {
  late final HabitBoxController _habitBoxController = HabitBoxController();
  List<HabitDayItem> _itemsList = List.empty();

  var sizedBoxKey = GlobalKey();
  double showedWidth = 0;

  @override
  void initState() {
    super.initState();

    _habitBoxController.itemsListController.stream.listen((data) {
      setState(() {
        _itemsList = data;
      });
    });

    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        showedWidth = (context.findRenderObject() as RenderBox).size.width;
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

    int itemsNumber = (showedWidth / minimumHabitDayItemWidth).floor();
    double itemWidth = (itemsNumber > 0) ? showedWidth / itemsNumber.toDouble() : minimumHabitDayItemWidth;

    return SizedBox(
      key: sizedBoxKey,
      height: 85,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        reverse: true,
        itemCount: _itemsList.length,
        itemBuilder: (BuildContext context, int index) {
          var item = _itemsList.elementAt(index);
          var score = item.value.toDouble() / widget.habit.habit.goalFormatted.toDouble();

          var previousScore = (_itemsList.elementAtOrNull(index + 1)?.value.toDouble() ?? 0) / widget.habit.habit.goalFormatted.toDouble();
          var nextScore = (index > 0) ?
              (_itemsList.elementAtOrNull(index - 1)?.value.toDouble() ?? 0) / widget.habit.habit.goalFormatted.toDouble() : 0;

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
              width: itemWidth.roundToDouble(),
              child: Column(
                children: [
                  Text(DateFormat.E().format(item.date).toUpperCase() + ".", style: Theme.of(context).textTheme.bodySmall?.copyWith(color: UiColors.grayText)),
                  Text(item.date.day.toString(), style: Theme.of(context).textTheme.labelMedium),
                  const SizedBox(height: 10),
                  if (score < 1)
                    NotCompletedHabitDayItem(completedRate: score, color: widget.habit.habit.color)
                  else
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween, 
                      children: [
                        if (previousScore >= 1)
                          Container(
                            height: 8,
                            width: 16,
                            decoration: BoxDecoration(
                              color: UiColors.blue20,
                              borderRadius: BorderRadius.horizontal(right: Radius.circular(4))
                            ),
                          ),
                        if (previousScore < 1)
                          SizedBox(width: 16),

                        CompletedHabitDayItem(color: widget.habit.habit.color),

                        if (nextScore >= 1)
                          Container(
                            height: 8,
                            width: 16,
                            decoration: BoxDecoration(
                              color: UiColors.blue20,
                              borderRadius: BorderRadius.horizontal(left: Radius.circular(4))
                            ),
                          ),
                        if (nextScore < 1)
                          SizedBox(width: 16),
                      ]
                    )
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
