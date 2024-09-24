// ignore_for_file: avoid_types_as_parameter_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:service_app/screens/labour/labour_list.dart';
import 'package:service_app/utilities/utilities.dart';

class SubServiceList extends StatefulWidget {
  final String service;
  const SubServiceList({super.key, required this.service});

  @override
  State<SubServiceList> createState() => _SubServiceListState();
}

class _SubServiceListState extends State<SubServiceList> {
  List<Map<String, dynamic>> selectedItems = [];

  num getTotalPrice() {
    return selectedItems.fold(0, (sum, item) => sum + item['price']);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('services')
              .where('service', isEqualTo: widget.service)
              .snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Center(child: CircularProgressIndicator());
            }
            var data = snapshot.data!.docs[0];
            List subservices = data['subservices'];
            List subprices = data['subservice_price'];
            return ListView.builder(
              itemCount: subservices.length,
              itemBuilder: (context, index) {
                bool isSelected = selectedItems.any(
                  (item) => item['subservice'] == subservices[index],
                );
                return ListTile(
                  title: Text(
                    subservices[index],
                    style: GoogleFonts.playfairDisplay(
                      color: theme_color,
                      fontWeight: FontWeight.w700,
                      fontSize: 18,
                    ),
                  ),
                  subtitle: Text(
                    "₹ ${subprices[index].toString()}",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  trailing: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        if (isSelected) {
                          selectedItems.removeWhere((item) =>
                              item['subservice'] == subservices[index]);
                        } else {
                          selectedItems.add({
                            'subservice': subservices[index],
                            'price': subprices[index],
                          });
                        }
                      });
                    },
                    child: Text(isSelected ? "REMOVE" : "ADD"),
                  ),
                );
              },
            );
          },
        ),
        bottomSheet: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: EdgeInsets.all(16.0),
              color: Colors.grey[200],
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total Price : ',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '₹ ${getTotalPrice()}',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Spacer(),
                  ElevatedButton(
                    onPressed: () {
                      num totalprice = getTotalPrice();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LabourList(
                            job: widget.service,
                            selectedItems: selectedItems,
                            totalprice: totalprice,
                          ),
                        ),
                      );
                    },
                    child: Text("PROCEED"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
