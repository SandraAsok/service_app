import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:service_app/screens/services/labour_list.dart';
import 'package:service_app/utilities/utilities.dart';

class Cleaning extends StatefulWidget {
  const Cleaning({super.key});

  @override
  State<Cleaning> createState() => _CleaningState();
}

class _CleaningState extends State<Cleaning> {
  final List<String> cleaningtext = [
    "Full Service",
    "Sanitaizing",
    "Floor Cleaning",
    "Dry Cleaning",
    "Kitchen Cleaning",
    "Bathroom Cleaning",
    "Pest Control",
  ];

  List cleaningIcon = [
    Icon(Icons.home_work_outlined, color: theme_color),
    Icon(Icons.clean_hands, color: theme_color),
    Icon(Icons.cleaning_services, color: theme_color),
    Icon(Icons.dry_cleaning, color: theme_color),
    Icon(Icons.restaurant, color: theme_color),
    Icon(Icons.bathroom_outlined, color: theme_color),
    Icon(Icons.pest_control, color: theme_color),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
        itemCount: cleaningtext.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).push(CupertinoPageRoute(
                    builder: (context) => LabourList(
                          job: 'Cleaning',
                          category: cleaningtext[index],
                        ),
                    fullscreenDialog: true));
              },
              child: ListTile(
                leading: cleaningIcon[index],
                title: Text(
                  cleaningtext[index],
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
