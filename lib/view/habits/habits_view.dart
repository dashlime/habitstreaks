import 'dart:async';

import 'package:flutter/material.dart';
import 'package:habitstreaks/main.dart';
import 'package:habitstreaks/models/habit.dart';
import 'package:habitstreaks/view/habits/extended_habit_box.dart';

class HabitsViewState extends State<HabitsView> {
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
      return DefaultTabController(
        length: 2, 
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            TabBar(tabs: [
              Tab(text: "Overall"),
              Tab(text: "Today")
            ]),
            Expanded(
              child: TabBarView(
                physics: NeverScrollableScrollPhysics(), 
                children: [
                  ListView(
                    children: [
                      for (var habit in habits) ExtendedHabitBox(habit: habit)
                    ]
                  ),
                  Text("Today view - WIP")
                ]
              )
            )
          ]
        )
      );
    }
  }
}

class HabitsView extends StatefulWidget {
  const HabitsView({super.key});

  @override
  State<HabitsView> createState() => HabitsViewState();
}