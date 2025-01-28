import 'dart:async';

import 'package:flutter/material.dart';
import 'package:habitstreaks/main.dart';
import 'package:habitstreaks/models/habit.dart';
import 'package:habitstreaks/view/habits/extended_habit_box.dart';

class AllHabitsViewState extends State<AllHabitsView> {
  List<HabitWithItems> habits = List.empty();
  late StreamSubscription<List<HabitWithItems>> subscription;

  @override
  void initState() {
    super.initState();

    subscription = database.watchAllHabits().listen((data) {
      setState(() {
        habits = data;
      });
    });
  }

  @override
  void dispose() {
    subscription.cancel();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (habits.isEmpty) {
      return Text("You haven't created any habits yet ... Click the \"+\" button below to create an habit");
    } else {
      return Column(children: [
        for (var habit in habits) ExtendedHabitBox(habit: habit)
      ]);
    }
  }
}

class AllHabitsView extends StatefulWidget {
  const AllHabitsView({super.key});

  @override
  State<AllHabitsView> createState() => AllHabitsViewState();
}