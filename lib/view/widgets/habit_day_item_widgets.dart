import 'package:flutter/material.dart';
import 'package:habitstreaks/models/habit.dart';
import 'package:habitstreaks/view/widgets/circular_progress_painter.dart';

class NotCompletedHabitDayItem extends StatelessWidget {
  final double completedRate;
  final HabitColorType color;

  const NotCompletedHabitDayItem({super.key, required this.completedRate, required this.color});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(25, 25),
      painter: CircularProgressPainter(progress: completedRate),
    );
  }
}

class CompletedHabitDayItem extends StatelessWidget {
  final HabitColorType color;

  const CompletedHabitDayItem({super.key, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: 25,
      height: 25,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/ic_validate_habit.png"),
          fit: BoxFit.cover
        )
      ),
    );
  }
}