import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:service_app/screens/services/additional_services/additional_services.dart';
import 'package:service_app/screens/services/additional_services/sub_screens/bakery.dart';
import 'package:service_app/screens/services/additional_services/sub_screens/clothing.dart';
import 'package:service_app/screens/services/additional_services/sub_screens/decoration.dart';
import 'package:service_app/screens/services/additional_services/sub_screens/groceries.dart';
import 'package:service_app/screens/services/additional_services/sub_screens/rental.dart';
import 'package:service_app/screens/services/additional_services/sub_screens/saloon.dart';
import 'package:service_app/screens/services/additional_services/sub_screens/tailoring.dart';
import 'package:service_app/screens/services/additional_services/sub_screens/vehicle.dart';
import 'package:service_app/screens/services/services/all_services.dart';
import 'package:service_app/screens/services/services/sub_screens/appliances.dart';
import 'package:service_app/screens/services/services/sub_screens/cleaning.dart';
import 'package:service_app/screens/services/services/sub_screens/electrical.dart';
import 'package:service_app/screens/services/services/sub_screens/furniture.dart';
import 'package:service_app/screens/services/services/sub_screens/homeshifting.dart';
import 'package:service_app/screens/services/services/sub_screens/painting.dart';
import 'package:service_app/screens/services/services/sub_screens/plumping.dart';
import 'package:service_app/utilities/list.dart';
import 'package:service_app/utilities/utilities.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

List<Widget> categoryscreens = [
  const Electrical(),
  const Painting(),
  const Plumping(),
  const Appliances(),
  const Cleaning(),
  const HomeShifting(),
  const Furniture(),
];

List<Widget> additionalscreens = [
  const BakeryDetail(),
  const Clothing(),
  const Tailoring(),
  const Saloon(),
  const Groceries(),
  const DecorationService(),
  const Rental(),
  const Vehicle(),
];

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - kToolbarHeight - 24) / 3;
    final double itemWidth = size.width / 2;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "A 2 Z SERVICE",
          style:
              GoogleFonts.breeSerif(fontWeight: FontWeight.w800, fontSize: 35),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.bookmark)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.notifications))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 50),
            space,
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    gradient: LinearGradient(
                      colors: [theme_color, Colors.white],
                    )),
                child: TextFormField(
                  cursorColor: Colors.white,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    filled: true,
                    prefixIcon: Icon(Icons.search, color: Colors.black),
                    focusColor: Colors.white,
                    hintText: 'Search',
                    hintStyle: TextStyle(color: Colors.black),
                  ),
                ),
              ),
            ),
            space,
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Services',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            CupertinoPageRoute(
                                builder: (context) => const AllServices(),
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
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: titles.length,
                    itemBuilder: (context, index) {
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
                                            categoryscreens[index],
                                        fullscreenDialog: true));
                              },
                              child: CircleAvatar(
                                radius: 40,
                                backgroundImage: AssetImage(category[index]),
                              ),
                            ),
                          ),
                          Text(
                            titles[index],
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15),
                          )
                        ],
                      );
                    },
                  ),
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
                                builder: (context) =>
                                    const AdditionalServices(),
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
              child: GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: additional.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisSpacing: 0.5,
                    crossAxisSpacing: 0.5,
                    childAspectRatio: (itemWidth / itemHeight),
                    crossAxisCount: 2,
                  ),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              CupertinoPageRoute(
                                  builder: (context) =>
                                      additionalscreens[index],
                                  fullscreenDialog: true));
                        },
                        child: Column(
                          children: [
                            Stack(
                              children: [
                                Container(
                                  height: 200,
                                  width: 300,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.2),
                                        spreadRadius: 2,
                                        blurRadius: 2,
                                        offset: const Offset(0, 5),
                                      ),
                                    ],
                                  ),
                                  child: Image.asset(
                                    additional[index],
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ],
                            ),
                            space,
                            Text(
                              additionaltitle[index],
                              style: const TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
