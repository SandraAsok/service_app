import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:service_app/utilities/utilities.dart';

class ShopBooking extends StatelessWidget {
  final String shop;
  const ShopBooking({super.key, required this.shop});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection('shops')
                  .where('category', isEqualTo: shop)
                  .snapshots(),
              builder: (context, snapshot) {
                return ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    final document = snapshot.data!.docs[index];
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
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: NetworkImage(document['image']))),
                            ),
                            spacewidth,
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                space,
                                space,
                                Text(
                                  document['shop_name'],
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text("⭐ ${document['rating']}"),
                                Text(
                                  "owner : ${document['owner']}",
                                  style: TextStyle(fontSize: 18),
                                ),
                                Text(
                                    "open from ${document['opening']} to ${document['closing']}",
                                    style: TextStyle(fontSize: 18)),
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
                );
              })),
    );
  }
}
