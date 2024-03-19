import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:service_app/screens/services/labour_detail.dart';
import 'package:service_app/utilities/utilities.dart';

class LabourList extends StatefulWidget {
  final String job;
  const LabourList({
    super.key,
    required this.job,
  });

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
                child: StreamBuilder(
                    stream: FirebaseFirestore.instance
                        .collection('labours')
                        .where('job', isEqualTo: widget.job)
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return ListView.builder(
                          shrinkWrap: true,
                          itemCount: snapshot.data!.docs.length,
                          itemBuilder: (BuildContext context, int index) {
                            final document = snapshot.data!.docs[index];
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      CupertinoPageRoute(
                                          builder: (context) =>
                                              const LabourDetail(),
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.all(20.0),
                                          child: Text(
                                            document['name'],
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
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
                                        CircleAvatar(
                                          backgroundColor: Colors.purple,
                                          radius: 35,
                                          backgroundImage: NetworkImage(
                                              document['image'][0]),
                                        )
                                      ],
                                    )),
                              ),
                            );
                          },
                        );
                      } else if (snapshot.hasError) {
                        log("ERROR While Loading labours ::: ${snapshot.error}");
                      }
                      return CircularProgressIndicator();
                    }),
              )
            ],
          ),
        ));
  }
}
