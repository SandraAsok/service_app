import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:service_app/screens/bookings/success.dart';
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
  final List selectedItems;
  final num totalprice;
  const CalendarBooking({
    super.key,
    required this.labourName,
    required this.labourAddress,
    required this.labourAge,
    required this.labourDetails,
    required this.image,
    required this.job,
    required this.phone,
    required this.selectedItems,
    required this.totalprice,
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

  // late Razorpay razorpay;

  // @override
  // void initState() {
  //   super.initState();
  //   razorpay = Razorpay();
  //   razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, handlepaymentsuccess);
  //   razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, handlepaymentError);
  //   razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, handleExternalWallet);
  // }

  // void checkout(int price) async {
  //   var options = {
  //     'key': 'rzp_test_xMQq5wAwtsmsfE',
  //     'amount': 100 * price,
  //     'name': 'Trippy Threads PVT.Ltd',
  //     'description': 'Trippy Threads PVT.Ltd',
  //     'prefill': {
  //       'contact': '8075190230',
  //       'email': 'sandratrippythreads@razorpay.com',
  //     }
  //   };
  //   try {
  //     razorpay.open(options);
  //   } catch (e) {
  //     log(e.toString());
  //   }
  // }

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
        'number': number.text,
        'address': address.text,
        'booked_date': today.toString().split(" ")[0],
        'hours': counter,
        'subservices': widget.selectedItems,
        'totalprice': widget.totalprice,
      });
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Success(),
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

  // void handlepaymentsuccess(PaymentSuccessResponse response) {
  //   log(response.toString());
  //   addBooking();
  // }

  // void handlepaymentError(PaymentFailureResponse response) {
  //   showDialog(
  //     context: context,
  //     builder: (context) {
  //       return AlertDialog(
  //         content: Text("Something went wrong ! Please try again"),
  //         actions: [
  //           TextButton(
  //               onPressed: () {
  //                 Navigator.pop(context);
  //               },
  //               child: Text("Go back"))
  //         ],
  //       );
  //     },
  //   );
  // }

  // void handleExternalWallet(ExternalWalletResponse response) {}

  TextEditingController name = TextEditingController();
  TextEditingController number = TextEditingController();
  TextEditingController notes = TextEditingController();
  TextEditingController address = TextEditingController();

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
            const Text(
              'For further verification',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Card(
              child: Container(
                height: 70,
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
                      hintText: 'Your name',
                    ),
                  ),
                ),
              ),
            ),
            const Divider(),
            Card(
              child: Container(
                height: 70,
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
                      hintText: 'Your Phone',
                      errorText: errorMessage,
                    ),
                  ),
                ),
              ),
            ),
            const Divider(),
            Card(
              child: Container(
                height: 150,
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
                      hintText: 'Your Address',
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 15),
            const Divider(),
          ],
        ),
      ),
      bottomSheet: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.all(16.0),
            color: Colors.grey[200],
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Total Price : ',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '₹ ${widget.totalprice}',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                ElevatedButton(
                  onPressed: () {
                    addBooking();
                  },
                  child: const Text("PROCEED TO BOOK"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
