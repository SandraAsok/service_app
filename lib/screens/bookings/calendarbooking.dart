import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
  const CalendarBooking({
    super.key,
    required this.labourName,
    required this.labourAddress,
    required this.labourAge,
    required this.labourDetails,
    required this.image,
    required this.job,
    required this.phone,
  });

  @override
  State<CalendarBooking> createState() => _CalendarBookingState();
}

class _CalendarBookingState extends State<CalendarBooking> {
  DateTime today = DateTime.now();
  String? errorMessage;

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

  bool validatePhoneNumber(String value) {
    if (value.isEmpty) {
      setState(() {
        errorMessage = 'Please enter your phone number';
      });
      return false;
    }
    // Regular expression for validating a phone number with exactly 10 digits
    final regex = RegExp(r'^\d{10}$');
    if (!regex.hasMatch(value)) {
      setState(() {
        errorMessage = 'Please enter a valid 10-digit phone number';
      });
      return false;
    }
    setState(() {
      errorMessage = null;
    });
    return true;
  }

  TextEditingController name = TextEditingController();
  TextEditingController number = TextEditingController();
  TextEditingController notes = TextEditingController();
  TextEditingController address = TextEditingController();

  addBooking() async {
    try {
      await FirebaseFirestore.instance.collection('bookings').add({
        'userId': FirebaseAuth.instance.currentUser!.email,
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
        'booked_date': today.toString().split(" ")[0],
        'hours': counter,
      });
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: const Text(
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
        content: const Text(
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
              const Padding(
                padding: EdgeInsets.only(top: 6.0, left: 8),
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
                    const Text(
                      'Selected Date',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const Icon(Icons.calendar_month_outlined),
                    Text(
                      '  :  ${today.toString().split(" ")[0]}',
                      style: const TextStyle(fontWeight: FontWeight.bold),
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
                        headerStyle: const HeaderStyle(
                            formatButtonVisible: false, titleCentered: true),
                        shouldFillViewport: true,
                        pageJumpingEnabled: true,
                        weekendDays: const [DateTime.saturday, DateTime.sunday],
                        selectedDayPredicate: (day) => isSameDay(day, today),
                        focusedDay: today,
                        firstDay: DateTime.now(),
                        lastDay: DateTime.utc(2034, 12, 12),
                        onDaySelected: onDayselected,
                      ),
                    ),
                  ),
                ),
              ),
              const Divider(),
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
                        title: const Text(
                          'Working Hours',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: const Text('Cost is per hour'),
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
                                    icon: const Icon(Icons.remove)),
                              ),
                              Text(
                                '$counter',
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                              CircleAvatar(
                                  child: IconButton(
                                onPressed: () {
                                  incrementCounter();
                                },
                                icon: const Icon(Icons.add),
                              )),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const Divider(),
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
                      decoration: const InputDecoration(
                        labelText: 'Leave the service notes',
                      ),
                    ),
                  ),
                ),
              ),
              const Divider(),
              const Text(
                'For further verification',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Card(
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
                    child: TextField(
                      controller: name,
                      decoration: const InputDecoration(
                        labelText: 'Your name',
                      ),
                    ),
                  ),
                ),
              ),
              const Divider(),
              Card(
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
                    child: TextFormField(
                      onChanged: validatePhoneNumber,
                      keyboardType: TextInputType.phone,
                      controller: number,
                      decoration: InputDecoration(
                        labelText: 'Your Phone',
                        errorText: errorMessage,
                      ),
                    ),
                  ),
                ),
              ),
              const Divider(),
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
                      decoration: const InputDecoration(
                        labelText: 'Your Address',
                      ),
                    ),
                  ),
                ),
              ),
              const Divider(),
              ElevatedButton(
                onPressed: () {
                  if (name.text.isEmpty ||
                      number.text.isEmpty ||
                      notes.text.isEmpty ||
                      address.text.isEmpty) {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text("Alert !"),
                        content: Text("Fields shouldn't be empty"),
                        actions: [
                          TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text("ok"))
                        ],
                      ),
                    );
                  } else {
                    addBooking();
                    name.clear();
                    number.clear();
                    notes.clear();
                    address.clear();
                    Navigator.pop(context);
                  }
                },
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.purple)),
                child: const Text(
                  "Book",
                  style: TextStyle(color: Colors.black),
                ),
              )
            ],
          ),
        ));
  }
}
