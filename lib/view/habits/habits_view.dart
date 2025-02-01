import 'dart:async';

import 'package:flutter/material.dart';
import 'package:habitstreaks/main.dart';
import 'package:habitstreaks/models/habit.dart';
import 'package:habitstreaks/view/habits/extended_habit_box.dart';
import 'package:habitstreaks/view/theme/colors.dart';

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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TabBar(
              tabAlignment: TabAlignment.start,
              isScrollable: true,
              padding: EdgeInsets.all(8),
              indicator: BoxDecoration(
                color: UiColors.background, // Selected tab background
                borderRadius: BorderRadius.circular(30),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                      color: Color(0x0F000000),
                      blurRadius: 4,
                      spreadRadius: 2,
                      offset: Offset(1, 1)
                  )
                ],
              ),
              indicatorSize: TabBarIndicatorSize.label,
              overlayColor: WidgetStatePropertyAll(Colors.transparent),
              dividerHeight: 0,
              labelPadding: EdgeInsets.symmetric(horizontal: 8),
              labelColor: UiColors.text, // Selected text color
              unselectedLabelColor: UiColors.grayText, // Unselected text color
              tabs: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Tab(text: "Overall", height: 35),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Tab(text: "Today", height: 35),
                ),
              ]
            ),
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