import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:service_app/screens/labour/labour_list.dart';
import 'package:service_app/screens/services/additional_services.dart';
import 'package:service_app/screens/services/all_services.dart';
import 'package:service_app/screens/services/shop_booking.dart';
import 'package:service_app/utilities/utilities.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - kToolbarHeight - 24) / 3;
    final double itemWidth = size.width / 2;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: Text(
            "A 2 Z SERVICE",
            style: GoogleFonts.breeSerif(
                fontWeight: FontWeight.w800, fontSize: 35),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //       builder: (context) => const MyBookings(),
                  //     ));
                },
                icon: const Icon(Icons.bookmark))
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 20),
              space,
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Services',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              CupertinoPageRoute(
                                  builder: (context) => AllServices(),
                                  fullscreenDialog: true));
                        },
                        child: const Text(
                          'See all',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ))
                  ],
                ),
              ),
              space,
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: 150,
                    width: double.infinity,
                    child: StreamBuilder(
                        stream: FirebaseFirestore.instance
                            .collection('services')
                            .snapshots(),
                        builder: (context, snapshot) {
                          return ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: snapshot.data!.docs.length,
                            itemBuilder: (context, index) {
                              final document = snapshot.data!.docs[index];
                              return Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            CupertinoPageRoute(
                                                builder: (context) =>
                                                    LabourList(
                                                        job: document[
                                                            'service']),
                                                //categoryscreens[index],
                                                fullscreenDialog: true));
                                      },
                                      child: CircleAvatar(
                                        radius: 40,
                                        backgroundImage:
                                            NetworkImage(document['cover']),
                                      ),
                                    ),
                                  ),
                                  Text(
                                    document['service'],
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15),
                                  )
                                ],
                              );
                            },
                          );
                        }),
                  )),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Additional Services',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              CupertinoPageRoute(
                                  builder: (context) => AdditionalServices(),
                                  fullscreenDialog: true));
                        },
                        child: const Text(
                          'See all',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ))
                  ],
                ),
              ),
              SingleChildScrollView(
                child: StreamBuilder(
                    stream: FirebaseFirestore.instance
                        .collection('additionalservices')
                        .snapshots(),
                    builder: (context, snapshot) {
                      return GridView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: snapshot.data!.docs.length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            mainAxisSpacing: 0.5,
                            crossAxisSpacing: 0.5,
                            childAspectRatio: (itemWidth / itemHeight),
                            crossAxisCount: 2,
                          ),
                          itemBuilder: (context, index) {
                            final document = snapshot.data!.docs[index];
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: GestureDetector(
                                onTap: () {
                                  if (document['option'] == 'shop') {
                                    Navigator.push(
                                        context,
                                        CupertinoPageRoute(
                                            builder: (context) => ShopBooking(
                                                shop: document['service']),
                                            fullscreenDialog: true));
                                  } else {
                                    Navigator.push(
                                        context,
                                        CupertinoPageRoute(
                                            builder: (context) => LabourList(
                                                  job: document['service'],
                                                ),
                                            fullscreenDialog: true));
                                  }
                                },
                                child: Column(
                                  children: [
                                    Stack(
                                      children: [
                                        Container(
                                          height: 200,
                                          width: 300,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.black
                                                    .withOpacity(0.2),
                                                spreadRadius: 2,
                                                blurRadius: 2,
                                                offset: const Offset(0, 5),
                                              ),
                                            ],
                                          ),
                                          child: Image.network(
                                            document['cover'],
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ],
                                    ),
                                    space,
                                    Text(
                                      document['service'],
                                      style: const TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          });
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
