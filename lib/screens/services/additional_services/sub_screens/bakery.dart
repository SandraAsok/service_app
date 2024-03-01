import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:service_app/utilities/utilities.dart';

class BakeryDetail extends StatefulWidget {
  const BakeryDetail({super.key});

  @override
  State<BakeryDetail> createState() => _BakeryDetailState();
}

class _BakeryDetailState extends State<BakeryDetail> {
  final List bakery = [
    "assets/images/weddingcake.jpg",
    "assets/images/birthdaycake.jpg",
    "assets/images/baked.jpg",
    "assets/images/cookies.jpg",
    "assets/images/dessert.jpeg",
    "assets/images/teacoffee.jpeg",
    "assets/images/snacks.jpeg",
    "assets/images/burger.jpeg",
    "assets/images/pizza.jpg",
  ];

  final List bakerytext = [
    "Wedding Cake",
    "Birthday Cake",
    "Baked Goods",
    "Cookies",
    "Desserts",
    "Tea/Coffee",
    "Snacks",
    "Burger",
    "Pizza",
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
            'Bakery Services',
            style:
                GoogleFonts.oswald(fontWeight: FontWeight.w900, fontSize: 25),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            GridView.builder(
              shrinkWrap: true,
              itemCount: bakery.length,
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
                    child: Container(
                      height: 200,
                      width: 190,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                              image: AssetImage(bakery[index]),
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
                                  borderRadius: BorderRadius.circular(30),
                                  color: Colors.white.withOpacity(0.6)),
                              child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: Text(
                                  bakerytext[index],
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
          ],
        ),
      ),
    );
  }
}
