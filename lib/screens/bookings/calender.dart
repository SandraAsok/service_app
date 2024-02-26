// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:service_app/utilities/utilities.dart';
import 'package:table_calendar/table_calendar.dart';

class Calendar extends StatefulWidget {
  const Calendar({super.key});

  @override
  State<Calendar> createState() => _CalendarState();
}

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
                                onPressed: () {},
                                icon: Icon(Icons.add),
                              )),
                              Text(
                                '0',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                              CircleAvatar(
                                child: IconButton(
                                    onPressed: () {}, icon: Icon(Icons.remove)),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Divider(),
            ],
          ),
        ));
  }
}
