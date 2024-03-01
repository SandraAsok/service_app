import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
              Center(
                child: Text(
                  "AtoZ Home Service",
                  style: heading_style,
                ),
              ),
              SizedBox(
                height: 60,
              ),
              SizedBox(
                height: size.height / 2,
                width: double.infinity,
                child:
                    const Image(image: AssetImage("assets/images/welcome.png")),
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
          height: size.height / 8,
          width: double.infinity,
          child: Column(
            children: [
              // Padding(
              //   padding: const EdgeInsets.all(10.0),
              //   child: Text(

              //       style: GoogleFonts.lora(
              //           fontWeight: FontWeight.bold, fontSize: 30)),
              // ),
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
                              builder: (context) => const SignUp(),
                              fullscreenDialog: false));
                      setState(() {
                        isfinish = false;
                      });
                    },
                    isFinished: isfinish,
                    onWaitingProcess: () {
                      Future.delayed(const Duration(seconds: 1), () {
                        setState(() {
                          isfinish = true;
                        });
                      });
                    },
                    activeColor: Colors.white,
                    buttonWidget: const Icon(
                      Icons.arrow_forward_ios_outlined,
                      color: Colors.black,
                    ),
                    buttonText: "GET STARTED",
                    buttontextstyle: const TextStyle(
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
