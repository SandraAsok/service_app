import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:service_app/screens/services/all_services.dart';
import 'package:service_app/screens/services/subservicelist.dart';
import 'package:service_app/utilities/utilities.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _current = 0;

  final List<String> imgList = [
    'assets/images/banner1.png',
    'assets/images/banner2.png',
    'assets/images/banner3.jpg',
    'assets/images/banner4.jpeg',
    'assets/images/banner5.jpg',
  ];

  List<Widget> generateImageTiles() {
    return imgList
        .map((element) => ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.asset(
                element,
                fit: BoxFit.cover,
                height: 500,
                width: 700,
              ),
            ))
        .toList();
  }

  Widget buildIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: imgList.map((url) {
        int index = imgList.indexOf(url);
        return Container(
          width: 8.0,
          height: 8.0,
          margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: _current == index
                ? const Color.fromRGBO(0, 0, 0, 0.9)
                : const Color.fromRGBO(0, 0, 0, 0.4),
          ),
        );
      }).toList(),
    );
  }

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
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 10),
              space,
              // carousel slider
              CarouselSlider(
                items: generateImageTiles(),
                options: CarouselOptions(
                  enlargeCenterPage: true,
                  enableInfiniteScroll: false,
                  autoPlay: true,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _current = index;
                    });
                  },
                ),
              ),
              space,
              // build indicator
              buildIndicator(),
              space,
              const Text(
                "Home Services\nYou Can Count On",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
              const Text(
                  "Get instant access to reliable and affordable services"),
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

              SingleChildScrollView(
                child: StreamBuilder(
                    stream: FirebaseFirestore.instance
                        .collection('services')
                        .snapshots(),
                    builder: (context, snapshot) {
                      return Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: GridView.builder(
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
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                SubServiceList(
                                                    service:
                                                        document['service']),
                                            fullscreenDialog: true));
                                  },
                                  child: Stack(
                                    children: [
                                      Container(
                                        height: 290,
                                        width: 250,
                                        decoration: BoxDecoration(
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                                  Colors.black.withOpacity(0.2),
                                              spreadRadius: 2,
                                              blurRadius: 2,
                                              offset: const Offset(0, 5),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        height: 250,
                                        width: 200,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: Colors.white),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            CircleAvatar(
                                              radius: 50,
                                              backgroundImage: NetworkImage(
                                                  document['cover']),
                                            ),
                                            space,
                                            space,
                                            Text(
                                              document['service'],
                                              style: const TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  // child: Stack(
                                  //   alignment: Alignment.bottomCenter,
                                  //   children: [
                                  //     Container(
                                  //       decoration: BoxDecoration(
                                  //           gradient: LinearGradient(
                                  //               colors: [
                                  //                 Colors.white
                                  //                     .withOpacity(0),
                                  //                 theme_color
                                  //                     .withOpacity(0.7)
                                  //               ],
                                  //               begin: Alignment.topLeft,
                                  //               end: Alignment
                                  //                   .bottomRight),
                                  //           borderRadius:
                                  //               BorderRadius.circular(
                                  //                   20)),
                                  //     ),
                                  //     Padding(
                                  //       padding:
                                  //           const EdgeInsets.all(8.0),
                                  //       child: Container(
                                  //         decoration: BoxDecoration(
                                  //             borderRadius:
                                  //                 BorderRadius.circular(
                                  //                     15),
                                  //             color: Colors.white
                                  //                 .withOpacity(0.6)),
                                  //         child: Padding(
                                  //           padding:
                                  //               const EdgeInsets.all(10),
                                  //           child: Text(
                                  //             document['service'],
                                  //             style: GoogleFonts.oswald(
                                  //                 fontWeight:
                                  //                     FontWeight.w900,
                                  //                 fontSize: 20),
                                  //           ),
                                  //         ),
                                  //       ),
                                  //     ),
                                  //   ],
                                  // ),
                                ),
                              );
                            }),
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
