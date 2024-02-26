import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:service_app/screens/services/additional_services/sub_screens/bakery.dart';
import 'package:service_app/screens/services/additional_services/sub_screens/clothing.dart';
import 'package:service_app/screens/services/additional_services/sub_screens/decoration.dart';
import 'package:service_app/screens/services/additional_services/sub_screens/general.dart';
import 'package:service_app/screens/services/additional_services/sub_screens/groceries.dart';
import 'package:service_app/screens/services/additional_services/sub_screens/rental.dart';
import 'package:service_app/screens/services/additional_services/sub_screens/saloon.dart';
import 'package:service_app/screens/services/additional_services/sub_screens/tailoring.dart';
import 'package:service_app/screens/services/additional_services/sub_screens/vehicle.dart';
import 'package:service_app/utilities/list.dart';
import 'package:service_app/utilities/utilities.dart';

class AdditionalServices extends StatefulWidget {
  const AdditionalServices({super.key});

  @override
  State<AdditionalServices> createState() => _AdditionalServicesState();
}

class _AdditionalServicesState extends State<AdditionalServices> {
  final List<Widget> additionalscreens1 = [
    const BakeryDetail(),
    const Clothing(),
    const Tailoring(),
    const Saloon(),
  ];

  final List<Widget> additionalscreens2 = [
    const Groceries(),
    const DecorationService(),
    const Rental(),
    const Vehicle(),
  ];
  @override
  Widget build(BuildContext context) {
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
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 4,
              itemBuilder: (BuildContext context, int index) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              CupertinoPageRoute(
                                  builder: (context) =>
                                      additionalscreens1[index],
                                  fullscreenDialog: true));
                        },
                        child: Container(
                          height: 200,
                          width: 190,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                  image: AssetImage(addimages1[index]),
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
                              Text(
                                addtext1[index],
                                style: GoogleFonts.oswald(
                                    fontWeight: FontWeight.w900, fontSize: 25),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              CupertinoPageRoute(
                                  builder: (context) =>
                                      additionalscreens2[index],
                                  fullscreenDialog: true));
                        },
                        child: Container(
                          height: 200,
                          width: 190,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                  image: AssetImage(addimages2[index]),
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
                                        begin: Alignment.topRight,
                                        end: Alignment.bottomLeft),
                                    borderRadius: BorderRadius.circular(20)),
                              ),
                              Text(
                                addtext2[index],
                                style: GoogleFonts.oswald(
                                    fontWeight: FontWeight.w900, fontSize: 25),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          CupertinoPageRoute(
                              builder: (context) => const General(),
                              fullscreenDialog: true));
                    },
                    child: Container(
                      height: 200,
                      width: 190,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                              image: AssetImage(addimages1[4]),
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
                          Text(
                            "GENERAL",
                            style: GoogleFonts.oswald(
                                fontWeight: FontWeight.w900, fontSize: 25),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                const Spacer(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
