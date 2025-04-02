import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ShowScheduleScreen extends StatelessWidget {
  const ShowScheduleScreen({super.key});

  static const Map<String, List<String>> schedule = {
    "Monday": ["SPORTS STROLL", "SPORTS RIDE", "WHAT’S TRENDING"],
    "Tuesday": ["SPORTS MEDICINE", "TRIBAL CORNER", "SPORTS RIDE"],
    "Wednesday": ["SPORTS STROLL", "SPORTS RIDE", "WHAT’S TRENDING"],
    "Thursday": ["TRIBAL CORNER", "SPORTS FINANCE", "SPORTS RIDE"],
    "Friday": ["SPORTS STROLL", "SPORTS RIDE", "WHAT’S TRENDING"],
    "Saturday": ["FLASHBACK", "KICK OFF", "WOMEN IN SPORTS", "SPORTS RIDE"],
    "Sunday": ["KICK OFF", "SPORTS RIDE"],
  };

  @override
  Widget build(BuildContext context) {
    String today = DateFormat('EEEE').format(DateTime.now());
    List<String> todaySchedule = schedule[today] ?? [];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Today's Schedule"),
        backgroundColor: const Color(0xFFFFD700), // Golden Yellow
        foregroundColor: Color(0xFF800020),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:
              todaySchedule
                  .map(
                    (show) => Text(show, style: const TextStyle(fontSize: 18)),
                  )
                  .toList(),
        ),
      ),
    );
  }
}
