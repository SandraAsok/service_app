import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:service_app/screens/labour/labour_list.dart';
import 'package:service_app/utilities/utilities.dart';

class Electrical extends StatefulWidget {
  const Electrical({super.key});

  @override
  State<Electrical> createState() => _ElectricalState();
}

class _ElectricalState extends State<Electrical> {
  final List<String> electricaltext = [
    "Wiring",
    "AC Installation",
    "Fan Installation",
    "Short Circuit",
    "Distribution Board/MSB",
  ];

  List electricalIcon = [
    Icon(
      Icons.electrical_services,
      color: theme_color,
    ),
    Icon(
      Icons.ac_unit_outlined,
      color: theme_color,
    ),
    Icon(
      Icons.wind_power_rounded,
      color: theme_color,
    ),
    Icon(
      Icons.electric_bolt_outlined,
      color: theme_color,
    ),
    Icon(
      Icons.computer_outlined,
      color: theme_color,
    )
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: Column(children: [
          ListView.builder(
            shrinkWrap: true,
            itemCount: electricaltext.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.all(20.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(CupertinoPageRoute(
                        builder: (context) => LabourList(
                              job: 'Electrical',
                              category: electricaltext[index],
                            ),
                        fullscreenDialog: true));
                  },
                  child: ListTile(
                    leading: electricalIcon[index],
                    title: Text(
                      electricaltext[index],
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              );
            },
          )
        ]),
      ),
    );
  }
}
