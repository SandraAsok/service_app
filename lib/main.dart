import 'package:flutter/material.dart';
import 'package:service_app/screens/bookings/calender.dart';
import 'package:service_app/screens/home/home.dart';
import 'package:service_app/screens/settings/settings.dart';
import 'package:service_app/screens/support/support.dart';
import 'package:service_app/utilities/utilities.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: BottomNav(),
  ));
}

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

final List<Widget> _pages = [
  const Home(),
  const Calendar(),
  const Support(),
  const Settings(),
];

class _BottomNavState extends State<BottomNav> {
  int _currentIndex = 0;

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: theme_color.withOpacity(0.7),
          currentIndex: _currentIndex,
          onTap: _onTabTapped,
          items: [
            BottomNavigationBarItem(
                backgroundColor: theme_color.withOpacity(0.7),
                icon: const Icon(Icons.home),
                label: 'Home'),
            const BottomNavigationBarItem(
                icon: Icon(Icons.calendar_month_outlined), label: 'Bookings'),
            const BottomNavigationBarItem(
                icon: Icon(Icons.support_agent), label: 'Support'),
            const BottomNavigationBarItem(
                icon: Icon(Icons.settings), label: 'Settings'),
          ]),
    );
  }
}
