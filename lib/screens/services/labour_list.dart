import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:service_app/screens/services/labour_detail.dart';
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
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Column(
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
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              CupertinoPageRoute(
                                  builder: (context) => const LabourDetail(),
                                  fullscreenDialog: true));
                        },
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
                                const Padding(
                                  padding: EdgeInsets.all(20.0),
                                  child: Text(
                                    'Person',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ),
                                IconButton(
                                    onPressed: () {},
                                    icon: const Icon(Icons.phone)),
                                ElevatedButton.icon(
                                    onPressed: () {},
                                    icon: const Icon(
                                        Icons.calendar_month_outlined),
                                    label: const Text("Book")),
                                const CircleAvatar(
                                  backgroundColor: Colors.purple,
                                  radius: 40,
                                  backgroundImage:
                                      AssetImage("assets/images/person.png"),
                                )
                              ],
                            )),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ));
  }
}
