import 'package:flutter/material.dart';
import 'package:service_app/utilities/utilities.dart';

class BakeryBooking extends StatelessWidget {
  final String category;
  const BakeryBooking({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                height: 150,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: theme_color)),
                child: Row(
                  children: [],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
