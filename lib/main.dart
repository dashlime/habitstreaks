import 'package:flutter/material.dart';
import 'package:habitstreaks/services/database.dart';
import 'package:habitstreaks/view/dialogs/add_habit_dialog.dart';
import 'package:habitstreaks/view/habits/habits_view.dart';
import 'package:habitstreaks/view/stats/stats_view.dart';
import 'package:habitstreaks/view/utilities/custom_icons.dart';

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
        title: 'Namer App',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
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
      body: screens.elementAt(_selectedBottomNavIndex),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddHabitDialog,
        child: const Icon(Icons.add),
      ),
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
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => HomePageState();
}
