import 'package:flutter/material.dart';
import 'package:habitstreaks/models/habit.dart';
import 'package:habitstreaks/view/habits/frequency_widget.dart';
import 'package:habitstreaks/view/habits/scrollable_habit_items_list.dart';
import 'package:habitstreaks/view/theme/colors.dart';
import 'package:habitstreaks/view/theme/custom_icons.dart';
import 'package:habitstreaks/view/utilities/converters.dart';
import 'package:habitstreaks/view/widgets/card.dart';
import 'package:habitstreaks/view/widgets/circular_progress_painter.dart';

class ExtendedHabitBox extends StatelessWidget {
  final HabitWithItems habit;
  final VoidCallback onGoToStatsClicked;

  const ExtendedHabitBox({super.key, required this.habit, required this.onGoToStatsClicked});

  String goalFormatted() {
    if (habit.habit.goalType == HabitGoalType.duration) {
      return "Goal : ${Converters.durationToText(habit.habit.goalFormatted)}";
    } else if (habit.habit.goalType == HabitGoalType.number) {
      return "Goal : x${habit.habit.goalFormatted}";
    }

    return "";
  }

  void showDetails(BuildContext context) {
    showModalBottomSheet(
      context: context, 
      showDragHandle: true,
      builder: (BuildContext context) {
        return Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 8).copyWith(bottom: 16),
          child: Wrap(
            children: [
              ListTile(
                onTap: () {
                  Navigator.pop(context);

                  onGoToStatsClicked();
                },
                leading: Icon(UiIcons.icChart),
                title: Text('Stats'),
              ),
              ListTile(
                onTap: () {
                  Navigator.pop(context);
                  
                },
                leading: Icon(Icons.edit_outlined),
                title: Text('Edit'),
              ),
              ListTile(
                onTap: () {
                  Navigator.pop(context);
                  
                },
                leading: Icon(Icons.delete_outlined),
                title: Text('Delete this habit')
              )
            ],
          ),
        );
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDetails(context);
      },
      child: UiCard(
        child: Container(
          width: double.infinity,
          margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 4,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(habit.habit.name, style: Theme.of(context).textTheme.titleSmall),
                      if (habit.habit.goalType != HabitGoalType.boolean)
                        Text(goalFormatted(), style: Theme.of(context).textTheme.bodySmall?.copyWith(color: UiColors.grayText)),
                    ]
                  ),
                  FrequencyWidget(frequency: habit.habit.frequency)
                ]
              ),

              ScrollableHabitItemsList(habit: habit),

              Row(
                spacing: 4,
                children: [
                  Text("3", style: Theme.of(context).textTheme.labelMedium),
                  CustomPaint(
                    size: const Size(20, 20),
                    painter: CircularProgressPainter(progress: 0.76, strokeWidth: 5),
                  ),

                  SizedBox(width: 2),
                  Text("17", style: Theme.of(context).textTheme.labelMedium),
                  Container(
                    alignment: Alignment.center,
                    width: 15,
                    height: 15,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/ic_validate_habit.png"),
                        fit: BoxFit.cover
                      )
                    ),
                  ),

                  SizedBox(width: 2),
                  Text("85%", style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: UiColors.grayText))
                ],
              )
            ]
          ),
        )
      )
    );
  }
}