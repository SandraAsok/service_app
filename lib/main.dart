import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:service_app/screens/bookings/calender.dart';
import 'package:service_app/screens/home/home.dart';
import 'package:service_app/screens/settings/settings.dart';
import 'package:service_app/screens/welcome.dart';
import 'package:service_app/utilities/utilities.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyCKRz2BwiB_VWW68Fmtb-e3A_vZhEeXteM",
      appId: "1:632744309940:android:063901222a9068f27393e1",
      messagingSenderId: "632744309940",
      projectId: "atozservice-b6c16",
    ),
  );
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Splash(),
  ));
}

String? finalemail;

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    getValidationData().whenComplete(
      () async {
        if (finalemail == null) {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const Welcome(),
              ));
        } else {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const BottomNav(),
              ));
        }
      },
    );
    super.initState();
  }

  Future getValidationData() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    var obtainedEmail = sharedPreferences.getString('email');
    setState(() {
      finalemail = obtainedEmail!;
    });
    log(finalemail!);
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

final List<Widget> _pages = [
  const Home(),
  const Calendar(),
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
            const GButton(icon: Icons.settings, text: 'Settings'),
          ]),
    );
  }
}
