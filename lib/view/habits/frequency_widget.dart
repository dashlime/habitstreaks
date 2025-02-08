import 'package:flutter/material.dart';
import 'package:habitstreaks/models/habit.dart';
import 'package:habitstreaks/view/theme/colors.dart';

class FrequencyWidget extends StatelessWidget {
  final Frequency frequency;

  const FrequencyWidget({super.key, required this.frequency});

  String getText() {
    if (frequency is DailyFrequency) {
      return "Daily";
    } else {
      return "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(vertical: 2, horizontal: 8),
      decoration: BoxDecoration(
        color: UiColors.blue05.withAlpha(122),
        borderRadius: BorderRadius.all(Radius.circular(5))
      ),
      child: Text(getText(), style: Theme.of(context).textTheme.labelSmall?.copyWith(color: UiColors.blue50)),
    );
  }
}