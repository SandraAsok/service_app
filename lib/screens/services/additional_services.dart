import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:service_app/screens/labour/labour_list.dart';
import 'package:service_app/screens/services/shop_booking.dart';
import 'package:service_app/utilities/utilities.dart';

class AdditionalServices extends StatefulWidget {
  const AdditionalServices({super.key});

  @override
  State<AdditionalServices> createState() => _AdditionalServicesState();
}

class _AdditionalServicesState extends State<AdditionalServices> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - kToolbarHeight - 24) / 3;
    final double itemWidth = size.width / 2;
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Additional Services',
            style:
                GoogleFonts.oswald(fontWeight: FontWeight.w900, fontSize: 25),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: size.height,
              child: StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection('additionalservices')
                      .snapshots(),
                  builder: (context, snapshot) {
                    return GridView.builder(
                      itemCount: snapshot.data!.docs.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          mainAxisSpacing: 0.5,
                          crossAxisSpacing: 0.5,
                          childAspectRatio: (itemWidth / itemHeight),
                          crossAxisCount: 2),
                      itemBuilder: (context, index) {
                        final document = snapshot.data!.docs[index];
                        return GestureDetector(
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
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Container(
                              height: 200,
                              width: 190,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  image: DecorationImage(
                                      image: NetworkImage(document['cover']),
                                      fit: BoxFit.cover)),
                              child: Stack(
                                alignment: Alignment.bottomCenter,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                            colors: [
                                              Colors.white.withOpacity(0),
                                              theme_color.withOpacity(0.7)
                                            ],
                                            begin: Alignment.topLeft,
                                            end: Alignment.bottomRight),
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: Colors.white.withOpacity(0.6),
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          document['service'],
                                          style: GoogleFonts.oswald(
                                              fontWeight: FontWeight.w900,
                                              fontSize: 25),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  }),
            ),
            // ListView.builder(
            //   shrinkWrap: true,
            //   physics: const NeverScrollableScrollPhysics(),
            //   itemCount: 4,
            //   itemBuilder: (BuildContext context, int index) {
            //     return Row(
            //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //       children: [
            //         Padding(
            //           padding: const EdgeInsets.all(5.0),
            //           child: GestureDetector(
            //             onTap: () {
            //               Navigator.push(
            //                   context,
            //                   CupertinoPageRoute(
            //                       builder: (context) =>
            //                           additionalscreens1[index],
            //                       fullscreenDialog: true));
            //             },
            //             child: Container(
            //               height: 200,
            //               width: 190,
            //               decoration: BoxDecoration(
            //                   borderRadius: BorderRadius.circular(20),
            //                   image: DecorationImage(
            //                       image: AssetImage(addimages1[index]),
            //                       fit: BoxFit.cover)),
            //               child: Stack(
            //                 alignment: Alignment.bottomCenter,
            //                 children: [
            //                   Container(
            //                     decoration: BoxDecoration(
            //                         gradient: LinearGradient(
            //                             colors: [
            //                               Colors.white.withOpacity(0),
            //                               theme_color.withOpacity(0.7)
            //                             ],
            //                             begin: Alignment.topLeft,
            //                             end: Alignment.bottomRight),
            //                         borderRadius: BorderRadius.circular(20)),
            //                   ),
            //                   Padding(
            //                     padding: const EdgeInsets.all(8.0),
            //                     child: Container(
            //                       decoration: BoxDecoration(
            //                           color: Colors.white.withOpacity(0.6),
            //                           borderRadius: BorderRadius.circular(20)),
            //                       child: Padding(
            //                         padding: const EdgeInsets.all(8.0),
            //                         child: Text(
            //                           addtext1[index],
            //                           style: GoogleFonts.oswald(
            //                               fontWeight: FontWeight.w900,
            //                               fontSize: 25),
            //                         ),
            //                       ),
            //                     ),
            //                   ),
            //                 ],
            //               ),
            //             ),
            //           ),
            //         ),
            //         Padding(
            //           padding: const EdgeInsets.all(8.0),
            //           child: GestureDetector(
            //             onTap: () {
            //               Navigator.push(
            //                   context,
            //                   CupertinoPageRoute(
            //                       builder: (context) =>
            //                           additionalscreens2[index],
            //                       fullscreenDialog: true));
            //             },
            //             child: Container(
            //               height: 200,
            //               width: 190,
            //               decoration: BoxDecoration(
            //                   borderRadius: BorderRadius.circular(20),
            //                   image: DecorationImage(
            //                       image: AssetImage(addimages2[index]),
            //                       fit: BoxFit.cover)),
            //               child: Stack(
            //                 alignment: Alignment.bottomCenter,
            //                 children: [
            //                   Container(
            //                     decoration: BoxDecoration(
            //                         gradient: LinearGradient(
            //                             colors: [
            //                               Colors.white.withOpacity(0),
            //                               theme_color.withOpacity(0.7)
            //                             ],
            //                             begin: Alignment.topRight,
            //                             end: Alignment.bottomLeft),
            //                         borderRadius: BorderRadius.circular(20)),
            //                   ),
            //                   Padding(
            //                     padding: const EdgeInsets.all(8.0),
            //                     child: Container(
            //                       decoration: BoxDecoration(
            //                         borderRadius: BorderRadius.circular(20),
            //                         color: Colors.white.withOpacity(0.6),
            //                       ),
            //                       child: Padding(
            //                         padding: const EdgeInsets.all(8.0),
            //                         child: Text(
            //                           addtext2[index],
            //                           style: GoogleFonts.oswald(
            //                               fontWeight: FontWeight.w900,
            //                               fontSize: 25),
            //                         ),
            //                       ),
            //                     ),
            //                   )
            //                 ],
            //               ),
            //             ),
            //           ),
            //         ),
            //       ],
            //     );
            //   },
            // ),
            // Row(
            //   children: [
            //     Padding(
            //       padding: const EdgeInsets.all(8.0),
            //       child: GestureDetector(
            //         onTap: () {
            //           Navigator.push(
            //               context,
            //               CupertinoPageRoute(
            //                   builder: (context) => const General(),
            //                   fullscreenDialog: true));
            //         },
            //         child: Container(
            //           height: 200,
            //           width: 190,
            //           decoration: BoxDecoration(
            //               borderRadius: BorderRadius.circular(20),
            //               image: DecorationImage(
            //                   image: AssetImage(addimages1[4]),
            //                   fit: BoxFit.cover)),
            //           child: Stack(
            //             alignment: Alignment.bottomCenter,
            //             children: [
            //               Container(
            //                 decoration: BoxDecoration(
            //                     gradient: LinearGradient(
            //                         colors: [
            //                           Colors.white.withOpacity(0),
            //                           theme_color.withOpacity(0.7)
            //                         ],
            //                         begin: Alignment.topLeft,
            //                         end: Alignment.bottomRight),
            //                     borderRadius: BorderRadius.circular(20)),
            //               ),
            //               Container(
            //                 decoration: BoxDecoration(
            //                     color: Colors.white.withOpacity(0.6),
            //                     borderRadius: BorderRadius.circular(20)),
            //                 child: Text(
            //                   "GENERAL",
            //                   style: GoogleFonts.oswald(
            //                       fontWeight: FontWeight.w900, fontSize: 25),
            //                 ),
            //               )
            //             ],
            //           ),
            //         ),
            //       ),
            //     ),
            //     const Spacer(),
            //   ],
            // ),
          ],
        ),
      ),
    );
  }
}
