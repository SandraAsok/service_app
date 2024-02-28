import 'package:flutter/material.dart';
import 'package:service_app/utilities/utilities.dart';

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
    "Grainter",
    "Coffee Maker",
  ];

  List applianceIcon = [
    Icon(Icons.aod, color: theme_color),
    Icon(Icons.kitchen_outlined, color: theme_color),
    Icon(Icons.tv, color: theme_color),
    Icon(Icons.water_drop_outlined, color: theme_color),
    Icon(Icons.blender, color: theme_color),
    Icon(Icons.coffee_maker_outlined, color: theme_color),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
        itemCount: appliancestext.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: GestureDetector(
              onTap: () {},
              child: ListTile(
                leading: applianceIcon[index],
                title: Text(
                  appliancestext[index],
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
