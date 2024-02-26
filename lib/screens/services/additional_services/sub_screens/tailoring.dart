import 'package:flutter/material.dart';

class Tailoring extends StatefulWidget {
  const Tailoring({super.key});

  @override
  State<Tailoring> createState() => _TailoringState();
}

class _TailoringState extends State<Tailoring> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("tailoring"),
      ),
    );
  }
}
