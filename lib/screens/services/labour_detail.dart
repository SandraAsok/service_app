import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:service_app/screens/bookings/calendarbooking.dart';
import 'package:service_app/screens/home/home.dart';
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
  const LabourDetail(
      {super.key,
      required this.name,
      required this.image,
      required this.age,
      required this.details,
      required this.address,
      required this.phone,
      required this.job});

  @override
  State<LabourDetail> createState() => _LabourDetailState();
}

String _phone = '';

class _LabourDetailState extends State<LabourDetail> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: CircleAvatar(
              backgroundImage: NetworkImage(widget.image),
              radius: 70,
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
                    const Text('Age:  ',
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
            width: 100,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () async {
                        setState(() {
                          _phone = widget.phone;
                        });
                        final url = Uri(scheme: 'tel', path: _phone);
                        if (await canLaunchUrl(url)) {
                          launchUrl(url);
                        }
                      },
                      icon: const Icon(Icons.phone)),
                  IconButton(
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
                              ),
                            ));
                      },
                      icon: const Icon(Icons.calendar_month_outlined))
                ]),
          )
        ]),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
                context,
                CupertinoPageRoute(
                  builder: (context) => Home(),
                ));
          },
          backgroundColor: theme_color,
          child: const Icon(Icons.home),
        ),
      ),
    );
  }
}
