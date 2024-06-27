import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:service_app/screens/services/additional_services/sub_screens/bakery/bakery.dart';
import 'package:service_app/screens/services/additional_services/sub_screens/groceries/groceries.dart';
import 'package:service_app/screens/services/additional_services/sub_screens/babysitting/babysitting.dart';
import 'package:service_app/screens/services/additional_services/sub_screens/petsitting/petsitting.dart';
import 'package:service_app/utilities/list.dart';
import 'package:service_app/utilities/utilities.dart';

class AdditionalServices extends StatefulWidget {
  const AdditionalServices({super.key});

  @override
  State<AdditionalServices> createState() => _AdditionalServicesState();
}

class _AdditionalServicesState extends State<AdditionalServices> {
  List<Widget> additionalscreens = [
    const BakeryDetail(),
    // const Clothing(),
    // const Tailoring(),
    // const Saloon(),
    const Groceries(),
    // const DecorationService(),
    const BabySitting(),
    const Petsitting(),
  ];

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
              child: GridView.builder(
                itemCount: additional.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisSpacing: 0.5,
                    crossAxisSpacing: 0.5,
                    childAspectRatio: (itemWidth / itemHeight),
                    crossAxisCount: 2),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          CupertinoPageRoute(
                              builder: (context) => additionalscreens[index],
                              fullscreenDialog: true));
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        height: 200,
                        width: 190,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                                image: AssetImage(additional[index]),
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
                                  borderRadius: BorderRadius.circular(20)),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(0.6),
                                    borderRadius: BorderRadius.circular(20)),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    additionaltext[index],
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
              ),
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
