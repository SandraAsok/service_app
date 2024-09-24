import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:service_app/main.dart';

class Success extends StatelessWidget {
  const Success({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Spacer(),
          Lottie.asset("assets/success.json"),
          const SizedBox(height: 50),
          MaterialButton(
            color: Colors.green[200],
            elevation: 20,
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BottomNav(),
                  ));
            },
            child: const Text(
              "Back To Home",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
