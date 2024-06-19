import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:service_app/screens/labour/labour_list.dart';
import 'package:service_app/utilities/utilities.dart';

class Plumping extends StatefulWidget {
  const Plumping({super.key});

  @override
  State<Plumping> createState() => _PlumpingState();
}

class _PlumpingState extends State<Plumping> {
  final List<String> plumpingtext = [
    "General Plumping Works",
    "Bathroom Water Supplies",
    "Water Leakage",
    "Filter Fixing",
  ];
  List plumpingIcon = [
    Icon(Icons.plumbing, color: theme_color),
    Icon(Icons.bathtub, color: theme_color),
    Icon(Icons.waterfall_chart_rounded, color: theme_color),
    Icon(Icons.filter_alt, color: theme_color),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
        itemCount: plumpingtext.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).push(CupertinoPageRoute(
                    builder: (context) => LabourList(
                          job: 'Plumping',
                          category: plumpingtext[index],
                        ),
                    fullscreenDialog: true));
              },
              child: ListTile(
                leading: plumpingIcon[index],
                title: Text(
                  plumpingtext[index],
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
