import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:service_app/utilities/utilities.dart';

class Saloon extends StatefulWidget {
  const Saloon({super.key});

  @override
  State<Saloon> createState() => _SaloonState();
}

class _SaloonState extends State<Saloon> {
  final List saloon = [
    "assets/images/bridal.jpg",
    "assets/images/groom.jpeg",
    "assets/images/girlhair.jpeg",
    "assets/images/boyhair.jpg",
    "assets/images/face.jpg",
    "assets/images/hairspa.jpeg",
    "assets/images/pedicure.jpeg",
    "assets/images/mehandi.jpg",
  ];
  final List saloontext = [
    "Bridal Makeup",
    "Groom Makeup",
    "Hair Styling",
    "Hair Styling",
    "Face Treatments",
    "Hair Spa",
    "Pedicure",
    "Mehandi",
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
            'saloon Services',
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
              itemCount: saloon.length,
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
                              image: AssetImage(saloon[index]),
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
                            saloontext[index],
                            style: GoogleFonts.oswald(
                                fontWeight: FontWeight.w900, fontSize: 25),
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
