import 'package:flutter/material.dart';
import 'package:habitstreaks/services/database.dart';
import 'package:habitstreaks/view/dialogs/add_habit_dialog.dart';
import 'package:habitstreaks/view/effects/drop_shadow_effect.dart';
import 'package:habitstreaks/view/habits/habits_view.dart';
import 'package:habitstreaks/view/stats/stats_view.dart';
import 'package:habitstreaks/view/theme/colors.dart';
import 'package:habitstreaks/view/theme/custom_icons.dart';
import 'package:habitstreaks/view/theme/fonts.dart';
import 'package:intl/intl.dart';

late Database database;

void main() {
  database = Database();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'HabitStreaks',
        theme: ThemeData(
          useMaterial3: true,
          fontFamily: "Rubik",
          textTheme: textTheme,
          colorScheme: colorScheme,
          inputDecorationTheme: const InputDecorationTheme(
            border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(15))),
          )
        ),
        home: const HomePage(),
      );
  }
}

class HomePageState extends State<HomePage> {
  int _selectedBottomNavIndex = 0;

  final List<Widget> screens = const [
    HabitsView(),
    StatsView()
  ];

  void _showAddHabitDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return const AddHabitDialog();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text((_selectedBottomNavIndex == 0) ? 'Habits' : 'Stats', style: Theme.of(context).textTheme.titleLarge),
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
      ),
      body: screens.elementAt(_selectedBottomNavIndex),
      floatingActionButton: (_selectedBottomNavIndex == 0) ? FloatingActionButton(
        onPressed: _showAddHabitDialog,
        child: const Icon(Icons.add),
      ) : null,
      bottomNavigationBar: DropShadowEffect(
        child: NavigationBar(
          destinations: const<Widget> [
            NavigationDestination(
              icon: Icon(UiIcons.icHomeOutlined),
              selectedIcon: Icon(UiIcons.icHomeFilled),
              label: "Habits"
            ),
            NavigationDestination(
              icon: Icon(UiIcons.icChart),
              label: "Stats"
            )
          ],
          elevation: 10,
          selectedIndex: _selectedBottomNavIndex,
          onDestinationSelected: (item) {
            setState(() {
              _selectedBottomNavIndex = item;
            });
          },
        )
      ),
      drawer: NavigationDrawer(
        onDestinationSelected: (item) {
          Navigator.pop(context);
        },
        selectedIndex: 0,
        children: <Widget> [
          Padding(
            padding: const EdgeInsets.fromLTRB(28, 16, 16, 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 Text(
                  'HabitStreaks',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 5),
                Text(
                  DateFormat.EEEE().format(DateTime.now()),
                  style: Theme.of(context).textTheme.labelSmall,
                ),
                Text(
                  DateFormat("d MMMM y").format(DateTime.now()),
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ]
            )
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(28, 5, 28, 5),
            child: Divider(),
          ),
          NavigationDrawerDestination(
            icon: const Icon(UiIcons.icHomeOutlined),
            selectedIcon: const Icon(UiIcons.icHomeFilled),
            label: Text("Home", style: Theme.of(context).textTheme.labelLarge),
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(28, 5, 28, 5),
            child: Divider(),
          ),
          const NavigationDrawerDestination(
            icon: Icon(UiIcons.icStarOutlined),
            label: Text("Rate the app"),
          ),
          const NavigationDrawerDestination(
            icon: Icon(Icons.share_outlined),
            label: Text("Share the app"),
          ),
        ],
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => HomePageState();
}
