import 'package:flutter/material.dart';

class Appliances extends StatefulWidget {
  const Appliances({super.key});

  @override
  State<Appliances> createState() => _AppliancesState();
}

class _AppliancesState extends State<Appliances> {
  final List appliancestext = [
    "Washing Machine",
    "Fridge",
    "Tv/Home Theater",
    "Filter Fixing",
  ];
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Appiances"),
      ),
    );
  }
}
