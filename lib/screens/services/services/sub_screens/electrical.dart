import 'package:flutter/material.dart';
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListView.separated(
              itemCount: electricaltext.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                    onTap: () {},
                    child: ListTile(
                      leading: CircleAvatar(),
                    ));
              },
              separatorBuilder: (BuildContext context, int index) {
                return space;
              },
            ),
          ],
        ),
      ),
    );
  }
}
