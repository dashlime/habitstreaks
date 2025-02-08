import 'dart:async';

import 'package:flutter/material.dart';
import 'package:habitstreaks/main.dart';
import 'package:habitstreaks/models/habit.dart';
import 'package:habitstreaks/view/effects/drop_shadow_effect.dart';
import 'package:habitstreaks/view/habits/extended_habit_box.dart';
import 'package:habitstreaks/view/theme/colors.dart';

class HabitsViewState extends State<HabitsView> {
  List<HabitWithItems> habits = List.empty();
  late StreamSubscription<List<HabitWithItems>> subscription;

  final _scrollController = ScrollController();
  var _showShadow = false;

  @override
  void initState() {
    super.initState();

    subscription = database.watchAllHabits().listen((data) {
      setState(() {
        habits = data;
      });
    });

    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    subscription.cancel();
    _scrollController.dispose();

    super.dispose();
  }

  void _scrollListener() {
    // Add shadow if the scroll position is greater than 0
    if (_scrollController.position.pixels > 0) {
      if (!_showShadow) {
        setState(() {
          _showShadow = true;
        });
      }
    } else {
      if (_showShadow) {
        setState(() {
          _showShadow = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    if (habits.isEmpty) {
      return const Text("You haven't created any habits yet ... Click the \"+\" button below to create an habit");
    } else {
      return DefaultTabController(
        length: 2, 
        child: Column(
          spacing: 5,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DropShadowEffect(
              offset: Offset(0, 2),
              alpha: _showShadow ? 25 : 0,
              child: Container(
                width: double.infinity,
                color: Theme.of(context).colorScheme.surface,
                child: TabBar(
                  tabAlignment: TabAlignment.start,
                  isScrollable: true,
                  padding: const EdgeInsets.all(8),
                  indicator: BoxDecoration(
                    color: UiColors.background, // Selected tab background
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: const <BoxShadow>[
                      BoxShadow(
                          color: Color(0x0F000000),
                          blurRadius: 4,
                          spreadRadius: 2,
                          offset: Offset(1, 1)
                      )
                    ],
                  ),
                  indicatorSize: TabBarIndicatorSize.label,
                  overlayColor: const WidgetStatePropertyAll(Colors.transparent),
                  dividerHeight: 0,
                  labelPadding: const EdgeInsets.symmetric(horizontal: 8),
                  labelColor: UiColors.text, // Selected text color
                  unselectedLabelColor: UiColors.grayText, // Unselected text color
                  tabs: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: const Tab(text: "Overall", height: 35),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: const Tab(text: "Today", height: 35),
                    ),
                  ]
                )
              )
            ),
            Expanded(
              child: TabBarView(
                physics: const NeverScrollableScrollPhysics(), 
                children: [
                  ListView.builder(
                    controller: _scrollController,
                    itemCount: habits.length,
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 100),
                    itemBuilder: (context, index) {
                      return ExtendedHabitBox(habit: habits.elementAt(index), onGoToStatsClicked: () { widget.onNavigateToStats(index); });
                    },
                  ),
                  const Text("Today view - WIP")
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
  final ValueChanged<int> onNavigateToStats;

  const HabitsView({super.key, required this.onNavigateToStats});

  @override
  State<HabitsView> createState() => HabitsViewState();
}