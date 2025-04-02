import 'package:flutter/material.dart';

import 'audio_service.dart';
import 'contact_us.dart';
import 'live_radio.dart';
import 'show_schedule.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AudioService().initialize(); // Ensure audio is ready
  runApp(const RadioApp());
}

class RadioApp extends StatelessWidget {
  const RadioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sure 97.5 FM',
      theme: ThemeData(
        primaryColor: const Color(0xFF800020), // Wine (Still for App Bar)
        scaffoldBackgroundColor: Colors.white, // Change background to white
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFFFD700), // Golden Yellow
          primary: const Color(0xFF800020),
          secondary: const Color(0xFFFFD700),
        ),
        textTheme: const TextTheme(
          bodyMedium: TextStyle(color: Colors.black),
        ), // Text color black
      ),

      home: const MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;
  final List<Widget> _screens = [
    const LiveRadioScreen(),
    const ShowScheduleScreen(),
    const ContactUsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        backgroundColor: const Color(0xFF800020),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white70,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.radio), label: "Live"),
          BottomNavigationBarItem(
            icon: Icon(Icons.schedule),
            label: "Schedule",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.phone), label: "Contact"),
        ],
      ),
    );
  }
}
