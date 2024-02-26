// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:service_app/screens/Login/login.dart';
import 'package:service_app/utilities/utilities.dart';
import 'package:swipeable_button_view/swipeable_button_view.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

bool isfinish = false;

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "AtoZ Home Service",
                style: heading_style,
              ),
              SizedBox(
                height: size.height / 2,
                width: double.infinity,
                child: Image(image: AssetImage("assets/images/welcome.png")),
              ),
            ],
          ),
        ),
      ),
      bottomSheet: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            gradient: LinearGradient(colors: [theme_color, Colors.white]),
          ),
          height: size.height / 3,
          width: double.infinity,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                    "Bringing Home to Life:\n     Your Trusted Partner for Seamless Services at Your Doorstep!",
                    style: GoogleFonts.lora(
                        fontWeight: FontWeight.bold, fontSize: 30)),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: SizedBox(
                  width: 300,
                  height: size.height / 20,
                  child: SwipeableButtonView(
                    onFinish: () async {
                      await Navigator.push(
                          context,
                          CupertinoPageRoute(
                              builder: (context) => SignUp(),
                              fullscreenDialog: false));
                      setState(() {
                        isfinish = false;
                      });
                    },
                    isFinished: isfinish,
                    onWaitingProcess: () {
                      Future.delayed(Duration(seconds: 2), () {
                        setState(() {
                          isfinish = true;
                        });
                      });
                    },
                    activeColor: Colors.white,
                    buttonWidget: Icon(
                      Icons.arrow_forward_ios_outlined,
                      color: Colors.black,
                    ),
                    buttonText: "GET STARTED",
                    buttontextstyle: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
