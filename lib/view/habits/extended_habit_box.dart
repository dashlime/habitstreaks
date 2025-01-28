import 'package:flutter/material.dart';
import 'package:habitstreaks/models/habit.dart';
import 'package:habitstreaks/view/habits/scrollable_habit_items_list.dart';
import 'package:habitstreaks/view/utilities/converters.dart';

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
    return Card(
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(habit.habit.name),
            if (habit.habit.goalType != HabitGoalType.boolean)
              Text(goalFormatted()),
            ScrollableHabitItemsList(habit: habit)
          ]
        ),
      )
    );
  }
}