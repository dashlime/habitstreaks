import 'package:flutter/material.dart';
import 'package:habitstreaks/models/habit.dart';
import 'package:habitstreaks/view/habits/scrollable_habit_items_list.dart';
import 'package:habitstreaks/view/theme/colors.dart';
import 'package:habitstreaks/view/utilities/converters.dart';
import 'package:habitstreaks/view/widgets/card.dart';

class ExtendedHabitBox extends StatelessWidget {
  final HabitWithItems habit;

  const ExtendedHabitBox({super.key, required this.habit});

  String goalFormatted() {
    if (habit.habit.goalType == HabitGoalType.duration) {
      return "Goal : ${Converters.durationToText(habit.habit.goalFormatted)}";
    } else if (habit.habit.goalType == HabitGoalType.number) {
      return "Goal : x${habit.habit.goalFormatted}";
    }

    return "";
  }

  @override
  Widget build(BuildContext context) {
    return UiCard(
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(habit.habit.name, style: Theme.of(context).textTheme.titleSmall),
            if (habit.habit.goalType != HabitGoalType.boolean)
              Text(goalFormatted(), style: Theme.of(context).textTheme.bodySmall?.copyWith(color: UiColors.grayText)),
            ScrollableHabitItemsList(habit: habit)
          ]
        ),
      )
    );
  }
}