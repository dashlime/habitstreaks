import 'package:flutter/material.dart';
import 'package:habitstreaks/services/database.dart';
import 'package:habitstreaks/view/dialogs/add_habit_dialog.dart';
import 'package:habitstreaks/view/habits/habits_view.dart';
import 'package:habitstreaks/view/stats/stats_view.dart';
import 'package:habitstreaks/view/theme/colors.dart';
import 'package:habitstreaks/view/theme/custom_icons.dart';
import 'package:habitstreaks/view/theme/fonts.dart';

late Database database;

void main() {
  database = Database();

  runApp(MyApp());
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
        ),
        home: HomePage(),
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
        return AddHabitDialog();
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
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(UiIcons.icHomeOutlined, size: 24),
            label: "Habits"
          ),
          BottomNavigationBarItem(
            icon: Icon(UiIcons.icChart, size: 24),
            label: "Stats"
          )
        ],
        currentIndex: _selectedBottomNavIndex,
        onTap: (item) {
          setState(() {
            _selectedBottomNavIndex = item;
          });
        },
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(child: Text("HabitStreaks")),
            ListTile(
              selected: true,
              leading: const Icon(UiIcons.icHomeOutlined),
              title: Text("Home", style: Theme.of(context).textTheme.labelLarge),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => HomePageState();
}
