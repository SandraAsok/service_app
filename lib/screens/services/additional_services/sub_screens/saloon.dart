import 'package:flutter/material.dart';

class Saloon extends StatefulWidget {
  const Saloon({super.key});

  @override
  State<Saloon> createState() => _SaloonState();
}

class _SaloonState extends State<Saloon> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("saloon"),
      ),
    );
  }
}
