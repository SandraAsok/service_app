import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
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
      bottomNavigationBar: GNav(
          backgroundColor: theme_color.withOpacity(0.7),
          selectedIndex: _currentIndex,
          activeColor: Colors.white,
          onTabChange: _onTabTapped,
          tabs: [
            GButton(
                backgroundColor: theme_color.withOpacity(0.7),
                icon: Icons.home,
                text: 'Home'),
            const GButton(
                icon: Icons.calendar_month_outlined, text: 'Bookings'),
            const GButton(icon: Icons.support_agent, text: 'Support'),
            const GButton(icon: Icons.settings, text: 'Settings'),
          ]),
    );
  }
}
