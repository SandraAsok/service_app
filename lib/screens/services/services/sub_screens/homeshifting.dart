import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:service_app/utilities/utilities.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeShifting extends StatefulWidget {
  const HomeShifting({super.key});

  @override
  State<HomeShifting> createState() => _HomeShiftingState();
}

String _phone = '';

class _HomeShiftingState extends State<HomeShifting> {
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
                        .where('job', isEqualTo: 'Home Shifting')
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
                                        padding: const EdgeInsets.all(20.0),
                                        child: Text(
                                          document['name'],
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      IconButton(
                                          onPressed: () async {
                                            setState(() {
                                              _phone = document['phone'];
                                            });
                                            final url = Uri(
                                                scheme: 'tel', path: _phone);
                                            if (await canLaunchUrl(url)) {
                                              launchUrl(url);
                                            }
                                          },
                                          icon: const Icon(Icons.phone)),
                                      ElevatedButton.icon(
                                          onPressed: () {},
                                          icon: const Icon(
                                              Icons.calendar_month_outlined),
                                          label: const Text("Book")),
                                      CircleAvatar(
                                        backgroundColor: Colors.purple,
                                        radius: 40,
                                        backgroundImage:
                                            NetworkImage(document['image'][0]),
                                      )
                                    ],
                                  )),
                            );
                          },
                        );
                      } else if (snapshot.hasError) {
                        log("ERROR loading ::: ${snapshot.error}");
                      }
                      return const CircularProgressIndicator();
                    }),
              )
            ],
          ),
        ));
  }
}
