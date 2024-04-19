// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:service_app/utilities/utilities.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarBooking extends StatefulWidget {
  final String labourName;
  final String labourAddress;
  final String labourAge;
  final String labourDetails;
  final String image;
  final String job;
  final String phone;
  final String category;
  const CalendarBooking(
      {super.key,
      required this.labourName,
      required this.labourAddress,
      required this.labourAge,
      required this.labourDetails,
      required this.image,
      required this.job,
      required this.phone,
      required this.category});

  @override
  State<CalendarBooking> createState() => _CalendarBookingState();
}

class _CalendarBookingState extends State<CalendarBooking> {
  DateTime today = DateTime.now();
  void onDayselected(selectedDay, focusedDay) {
    setState(() {
      today = selectedDay;
    });
  }

  int counter = 0;

  incrementCounter() {
    setState(() {
      counter++;
    });
  }

  decrementCounter() {
    setState(() {
      counter--;
    });
  }

  TextEditingController name = TextEditingController();
  TextEditingController number = TextEditingController();
  TextEditingController notes = TextEditingController();
  TextEditingController address = TextEditingController();

  addBooking() async {
    try {
      await FirebaseFirestore.instance.collection('bookings').add({
        'category': widget.category,
        'labour_name': widget.labourName,
        'age': widget.labourAge,
        'labour_address': widget.labourAddress,
        'details': widget.labourDetails,
        'image': widget.image,
        'job': widget.job,
        'labour_phone': widget.phone,
        'name': name.text,
        'notes': notes.text,
        'number': number.text,
        'address': address.text,
        'booked_date': today,
        'hours': counter,
      });
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
          'Booked your service successfully',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.purple,
        action: SnackBarAction(
          label: 'Dismiss',
          onPressed: () {},
        ),
      ));
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
          'Something went wrong',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.purple,
        action: SnackBarAction(
          label: 'Dismiss',
          onPressed: () {},
        ),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Book Your Service',
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
                padding: const EdgeInsets.all(8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Selected Date',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Icon(Icons.calendar_month_outlined),
                    Text(
                      '  :  ${today.toString().split(" ")[0]}',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
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
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  child: Container(
                    height: 100,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        gradient: LinearGradient(
                            colors: [theme_color, Colors.white],
                            begin: Alignment.bottomRight,
                            end: Alignment.topLeft)),
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: ListTile(
                        title: Text(
                          'Working Hours',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text('Cost is per hour'),
                        trailing: SizedBox(
                          width: 110,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CircleAvatar(
                                child: IconButton(
                                    onPressed: () {
                                      decrementCounter();
                                    },
                                    icon: Icon(Icons.remove)),
                              ),
                              Text(
                                '$counter',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                              CircleAvatar(
                                  child: IconButton(
                                onPressed: () {
                                  incrementCounter();
                                },
                                icon: Icon(Icons.add),
                              )),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Divider(),
              Card(
                child: Container(
                  height: 200,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: LinearGradient(
                          colors: [theme_color, Colors.white],
                          begin: Alignment.bottomRight,
                          end: Alignment.topLeft)),
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: TextField(
                      controller: notes,
                      maxLines: 5,
                      decoration: InputDecoration(
                        labelText: 'Leave the service notes',
                      ),
                    ),
                  ),
                ),
              ),
              Divider(),
              Text(
                'For further verification',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Card(
                child: Container(
                  height: 80,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: LinearGradient(
                          colors: [theme_color, Colors.white],
                          begin: Alignment.bottomRight,
                          end: Alignment.topLeft)),
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: TextField(
                      controller: name,
                      decoration: InputDecoration(
                        labelText: 'Your name',
                      ),
                    ),
                  ),
                ),
              ),
              Divider(),
              Card(
                child: Container(
                  height: 80,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: LinearGradient(
                          colors: [theme_color, Colors.white],
                          begin: Alignment.bottomRight,
                          end: Alignment.topLeft)),
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: TextField(
                      controller: number,
                      decoration: InputDecoration(
                        labelText: 'Your Phone',
                      ),
                    ),
                  ),
                ),
              ),
              Divider(),
              Card(
                child: Container(
                  height: 200,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: LinearGradient(
                          colors: [theme_color, Colors.white],
                          begin: Alignment.bottomRight,
                          end: Alignment.topLeft)),
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: TextField(
                      controller: address,
                      maxLines: 5,
                      decoration: InputDecoration(
                        labelText: 'Your Address',
                      ),
                    ),
                  ),
                ),
              ),
              Divider(),
              ElevatedButton(
                onPressed: () {
                  addBooking();
                  name.clear();
                  number.clear();
                  notes.clear();
                  address.clear();
                },
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.purple)),
                child: Text(
                  "Book",
                  style: TextStyle(color: Colors.black),
                ),
              )
            ],
          ),
        ));
  }
}
