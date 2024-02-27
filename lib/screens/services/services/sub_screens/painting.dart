import 'package:flutter/material.dart';

class Painting extends StatefulWidget {
  const Painting({super.key});

  @override
  State<Painting> createState() => _PaintingState();
}

class _PaintingState extends State<Painting> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Painting"),
      ),
    );
  }
}
