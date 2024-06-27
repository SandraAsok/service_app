import 'package:flutter/material.dart';
import 'package:service_app/utilities/utilities.dart';

class Groceries extends StatefulWidget {
  const Groceries({super.key});

  @override
  State<Groceries> createState() => _GroceriesState();
}

class _GroceriesState extends State<Groceries> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              height: 200,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: theme_color)),
              child: Row(
                children: [
                  spacewidth,
                  Container(
                    height: 150,
                    width: 120,
                    color: Colors.blue,
                  ),
                  spacewidth,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      space,
                      space,
                      Text(
                        "Reliance Fresh",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text("⭐ 4.5"),
                      Row(
                        children: [
                          Text("Opens at ", style: TextStyle(fontSize: 18)),
                          Text("8 am",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold)),
                        ],
                      ),
                      Text("Dine-in   -   Takeaway    -   Delivery"),
                      space,
                      Row(
                        children: [
                          ElevatedButton.icon(
                            onPressed: () {},
                            icon: Icon(Icons.local_shipping),
                            label: Text("Order"),
                          ),
                          spacewidth,
                          spacewidth,
                          ElevatedButton.icon(
                            onPressed: () {},
                            icon: Icon(Icons.call),
                            label: Text("Enquiry"),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      )),
    );
  }
}
