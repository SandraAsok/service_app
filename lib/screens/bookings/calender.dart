// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:service_app/utilities/utilities.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:url_launcher/url_launcher.dart';

class Calendar extends StatefulWidget {
  const Calendar({super.key});

  @override
  State<Calendar> createState() => _CalendarState();
}

String _phone = '';

class _CalendarState extends State<Calendar> {
  DateTime today = DateTime.now();
  void onDayselected(selectedDay, focusedDay) {
    setState(() {
      today = selectedDay;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Your Booked Services',
                style: GoogleFonts.oswald(
                    fontWeight: FontWeight.bold, color: theme_color),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 6.0, left: 8),
                child: Icon(Icons.arrow_downward_outlined),
              )
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              space,
              Padding(
                padding: const EdgeInsets.all(15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Select Date',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Icon(Icons.calendar_month_outlined)
                  ],
                ),
              ),
              Text(
                'Selected Day =${today.toString().split(" ")[0]}',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    //  elevation: 0.5,
                    child: Container(
                      width: 410,
                      height: 400,
                      decoration: BoxDecoration(
                        border: Border.all(color: theme_color),
                        borderRadius: BorderRadius.circular(30),
                        // color: theme_color.withOpacity(0.4),
                      ),
                      child: TableCalendar(
                        locale: "en_US",
                        rowHeight: 60,
                        headerStyle: HeaderStyle(
                            formatButtonVisible: false, titleCentered: true),
                        shouldFillViewport: true,
                        pageJumpingEnabled: true,
                        weekendDays: [DateTime.saturday, DateTime.sunday],
                        selectedDayPredicate: (day) => isSameDay(day, today),
                        focusedDay: today,
                        firstDay: DateTime.utc(2024, 01, 01),
                        lastDay: DateTime.utc(2034, 12, 12),
                        onDaySelected: onDayselected,
                      ),
                    ),
                  ),
                ),
              ),
              Divider(),
              StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection('bookings')
                      .where('userId',
                          isEqualTo: FirebaseAuth.instance.currentUser!.email)
                      .where('booked_date',
                          isEqualTo: today.toString().split(" ")[0])
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                        shrinkWrap: true,
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (context, index) {
                          final document = snapshot.data!.docs[index];
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Slidable(
                              endActionPane: ActionPane(
                                motion: StretchMotion(),
                                children: [
                                  SlidableAction(
                                    onPressed: (context) async {
                                      setState(() {
                                        _phone = document['labour_phone'];
                                      });
                                      final url =
                                          Uri(scheme: 'tel', path: _phone);
                                      if (await canLaunchUrl(url)) {
                                        launchUrl(url);
                                      }
                                    },
                                    backgroundColor: theme_color,
                                    icon: Icons.phone,
                                  )
                                ],
                              ),
                              child: Container(
                                  height: 80,
                                  decoration: BoxDecoration(
                                    color: theme_color.withOpacity(0.5),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Row(
                                    children: [
                                      Spacer(),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                              '${document['category']} - ${document['labour_name']}',
                                              style: normalStyle),
                                          Text(
                                              'Total working hours : ${document['hours']}',
                                              style: normalStyle),
                                          Text(today.toString().split(" ")[0],
                                              style: normalStyle),
                                        ],
                                      ),
                                      Spacer(),
                                      Icon(Icons.swipe_left, size: 35),
                                      SizedBox(width: 10),
                                    ],
                                  )),
                            ),
                          );
                        },
                      );
                    } else if (snapshot.hasError) {
                      log('ERROR ::: ${snapshot.error}');
                    }
                    return CircularProgressIndicator();
                  })
            ],
          ),
        ));
  }
}
