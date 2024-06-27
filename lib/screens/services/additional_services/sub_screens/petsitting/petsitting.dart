import 'package:flutter/material.dart';
import 'package:service_app/utilities/utilities.dart';

class Petsitting extends StatefulWidget {
  const Petsitting({super.key});

  @override
  State<Petsitting> createState() => _PetsittingState();
}

class _PetsittingState extends State<Petsitting> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage("assets/images/petsitting.jpg"))),
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
                      colors: [Colors.white, Colors.transparent],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(20),
                        child: Text(
                          "name",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.phone,
                            color: Colors.white,
                          )),
                      ElevatedButton.icon(
                          onPressed: () {},
                          icon: Icon(Icons.calendar_month_outlined),
                          label: Text("Book")),
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
