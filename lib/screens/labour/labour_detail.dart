import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:service_app/main.dart';
import 'package:service_app/screens/bookings/calendarbooking.dart';
import 'package:service_app/utilities/utilities.dart';
import 'package:url_launcher/url_launcher.dart';

class LabourDetail extends StatefulWidget {
  final String name;
  final String image;
  final String age;
  final String details;
  final String address;
  final String phone;
  final String job;
  final List selectedItems;
  final num totalprice;
  const LabourDetail({
    super.key,
    required this.name,
    required this.image,
    required this.age,
    required this.details,
    required this.address,
    required this.phone,
    required this.job,
    required this.selectedItems,
    required this.totalprice,
  });

  @override
  State<LabourDetail> createState() => _LabourDetailState();
}

String _phone = '';

class _LabourDetailState extends State<LabourDetail> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: CircleAvatar(
                backgroundImage: NetworkImage(widget.image),
                radius: 90,
              ),
            ),
          ),
          Text(
            widget.name,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
          ),
          SizedBox(
            child: ListView(shrinkWrap: true, children: [
              ListTile(
                title: Row(
                  children: [
                    const Text('Average Age Limit:  ',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    Text(widget.age)
                  ],
                ),
                subtitle: Text(widget.details),
              ),
              ListTile(
                title: const Text(
                  "Address :",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text(widget.address),
              )
            ]),
          ),
          const SizedBox(height: 30),
          Container(
            height: 50,
            width: 500,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton.icon(
                      onPressed: () async {
                        setState(() {
                          _phone = widget.phone;
                        });
                        final url = Uri(scheme: 'tel', path: _phone);
                        if (await canLaunchUrl(url)) {
                          launchUrl(url);
                        }
                      },
                      icon: const Icon(Icons.phone),
                      label: Text('Enquiry')),
                  spacewidth,
                  ElevatedButton.icon(
                    onPressed: () {
                      Navigator.push(
                          context,
                          CupertinoPageRoute(
                            builder: (context) => CalendarBooking(
                              labourName: widget.name,
                              labourAddress: widget.address,
                              labourAge: widget.age,
                              labourDetails: widget.details,
                              image: widget.image,
                              job: widget.job,
                              phone: widget.phone,
                              selectedItems: widget.selectedItems,
                              totalprice: widget.totalprice,
                            ),
                          ));
                    },
                    icon: const Icon(Icons.calendar_month_outlined),
                    label: Text("Book"),
                  ),
                  Spacer(),
                ]),
          ),
          Divider(),
          Text(
            "All Feedbacks",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection('feedbacks')
                  .where('labour_name', isEqualTo: widget.name)
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
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Divider(),
                              Text(
                                document['userID'],
                                style: TextStyle(fontStyle: FontStyle.italic),
                              ),
                              space,
                              Text(
                                document['review'],
                                style: TextStyle(fontSize: 18),
                              ),
                              Divider(),
                            ],
                          ));
                    },
                  );
                } else if (snapshot.hasError) {
                  log('ERROR ::: ${snapshot.error}');
                }
                return CircularProgressIndicator();
              })
        ]),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
                context,
                CupertinoPageRoute(
                  builder: (context) => const BottomNav(),
                ));
          },
          backgroundColor: theme_color,
          child: const Icon(Icons.home),
        ),
      ),
    );
  }
}
