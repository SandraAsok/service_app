import 'package:flutter/material.dart';
import 'package:service_app/utilities/utilities.dart';

class BabySitting extends StatefulWidget {
  const BabySitting({super.key});

  @override
  State<BabySitting> createState() => _BabySittingState();
}

class _BabySittingState extends State<BabySitting> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage("assets/images/babysitting.jpeg"))),
        child: ListView.builder(
          itemCount: 5,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: GestureDetector(
                onTap: () {},
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    gradient: LinearGradient(
                      colors: [theme_color, Colors.transparent],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(20),
                        child: Text(
                          "name",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      IconButton(
                          onPressed: () {}, icon: const Icon(Icons.phone)),
                      ElevatedButton.icon(
                          onPressed: () {},
                          icon: const Icon(Icons.calendar_month_outlined),
                          label: const Text("Book")),
                      CircleAvatar(
                        backgroundColor: theme_color,
                        radius: 35,
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      )),
    );
  }
}
