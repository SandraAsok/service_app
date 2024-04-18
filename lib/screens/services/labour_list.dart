import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:service_app/screens/bookings/calendarbooking.dart';
import 'package:service_app/screens/services/labour_detail.dart';
import 'package:service_app/utilities/utilities.dart';
import 'package:url_launcher/url_launcher.dart';

class LabourList extends StatefulWidget {
  final String job;
  const LabourList({
    super.key,
    required this.job,
  });

  @override
  State<LabourList> createState() => _LabourListState();
}

String _phone = '';

class _LabourListState extends State<LabourList> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
                                    builder: (context) => LabourDetail(
                                      name: document['name'],
                                      image: document['image'][0],
                                      age: document['age'],
                                      details: document['details'],
                                      address: document['address'],
                                      phone: document['phone'],
                                      job: document['job'],
                                    ),
                                    fullscreenDialog: true,
                                  ),
                                );
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  gradient: LinearGradient(
                                    colors: [theme_color, Colors.white],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.all(20.0),
                                      child: Text(
                                        document['name'],
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    IconButton(
                                      onPressed: () async {
                                        setState(() {
                                          _phone = document['phone'];
                                        });
                                        final url =
                                            Uri(scheme: 'tel', path: _phone);
                                        if (await canLaunchUrl(url)) {
                                          launchUrl(url);
                                        }
                                      },
                                      icon: Icon(Icons.phone),
                                    ),
                                    ElevatedButton.icon(
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            CupertinoPageRoute(
                                              builder: (context) =>
                                                  CalendarBooking(
                                                labourName: document['name'],
                                                labourAddress:
                                                    document['address'],
                                                labourAge: document['age'],
                                                labourDetails:
                                                    document['details'],
                                                image: document['image'][0],
                                                job: document['job'],
                                                phone: document['phone'],
                                              ),
                                            ));
                                      },
                                      icon: Icon(Icons.calendar_month_outlined),
                                      label: Text("Book"),
                                    ),
                                    CircleAvatar(
                                      backgroundColor: Colors.purple,
                                      radius: 35,
                                      backgroundImage: NetworkImage(
                                        document['image'][0],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    } else if (snapshot.hasError) {
                      log("ERROR While Loading labours ::: ${snapshot.error}");
                    }
                    return CircularProgressIndicator();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
