import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:service_app/screens/bookings/calender.dart';
import 'package:service_app/screens/home/home.dart';
import 'package:service_app/screens/settings/settings.dart';
import 'package:service_app/screens/support/support.dart';
import 'package:service_app/screens/welcome.dart';
import 'package:service_app/utilities/utilities.dart';

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
  runApp(MaterialApp(
    navigatorKey: navigatorKey,
    debugShowCheckedModeBanner: false,
    home: const Splash(),
  ));
}

final navigatorKey = GlobalKey<NavigatorState>();

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else if (snapshot.hasError) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: const Text("Something went wrong"),
              action: SnackBarAction(
                label: 'Dismiss',
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ));
          } else if (snapshot.hasData) {
            return const BottomNav();
          }
          return const Welcome();
        },
      ),
    );
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
