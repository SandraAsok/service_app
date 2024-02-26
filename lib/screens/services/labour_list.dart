// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:service_app/utilities/utilities.dart';

class LabourList extends StatefulWidget {
  const LabourList({super.key});

  @override
  State<LabourList> createState() => _LabourListState();
}

class _LabourListState extends State<LabourList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        space,
        SizedBox(
          height: 900,
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: 6,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        gradient: LinearGradient(
                            colors: [theme_color, Colors.white],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Text(
                            'Surumi \n Jamal',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        IconButton(onPressed: () {}, icon: Icon(Icons.phone)),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.calendar_month_outlined)),
                        CircleAvatar(
                          backgroundColor: Colors.purple,
                          radius: 40,
                          backgroundImage: NetworkImage(
                              'data:image/jpeg;base64,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'),
                        ),
                      ],
                    )),
              );
            },
          ),
        )
      ],
    ));
  }
}
