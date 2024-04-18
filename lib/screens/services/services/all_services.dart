import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:service_app/screens/services/services/sub_screens/appliances.dart';
import 'package:service_app/screens/services/services/sub_screens/cleaning.dart';
import 'package:service_app/screens/services/services/sub_screens/electrical.dart';
import 'package:service_app/screens/services/services/sub_screens/furniture.dart';
import 'package:service_app/screens/services/services/sub_screens/homeshifting.dart';
import 'package:service_app/screens/services/services/sub_screens/painting.dart';
import 'package:service_app/screens/services/services/sub_screens/plumping.dart';
import 'package:service_app/utilities/list.dart';
import 'package:service_app/utilities/utilities.dart';

class AllServices extends StatefulWidget {
  const AllServices({super.key});

  @override
  State<AllServices> createState() => _AllServicesState();
}

class _AllServicesState extends State<AllServices> {
  List<Widget> categoryscreens = [
    const Electrical(),
    const Painting(),
    const Plumping(),
    const Appliances(),
    const Cleaning(),
    const HomeShifting(),
    const Furniture(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Services',
                        style: GoogleFonts.oswald(
                            fontWeight: FontWeight.bold, fontSize: 40)),
                  ),
                ),
                Container(
                  height: 200,
                  width: 200,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/images/van.png"),
                          fit: BoxFit.cover)),
                ),
              ],
            ),
            ListView.separated(
              itemCount: serviceimages.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => categoryscreens[index],
                            fullscreenDialog: true));
                  },
                  child: Container(
                    width: 200,
                    height: 120,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        image: DecorationImage(
                            image: AssetImage(
                              serviceimages[index],
                            ),
                            fit: BoxFit.cover)),
                    child: Container(
                      decoration: BoxDecoration(
                          gradient: LinearGradient(colors: [
                        Colors.white.withOpacity(0),
                        theme_color
                      ], begin: Alignment.topRight, end: Alignment.bottomLeft)),
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: ListTile(
                          title: Text(
                            servicetext[index],
                            style: GoogleFonts.oswald(
                                fontWeight: FontWeight.w900, fontSize: 28),
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return space;
              },
            ),
          ],
        ),
      ),
    );
  }
}
