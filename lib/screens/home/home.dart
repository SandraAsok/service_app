import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:service_app/screens/services/additional_services/additional_services.dart';
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
        leading: const Padding(
          padding: EdgeInsets.all(8.0),
          child: CircleAvatar(
              backgroundImage: NetworkImage(
                  'data:image/jpeg;base64,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')),
        ),
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
                        onTap: () {},
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
