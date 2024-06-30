import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:service_app/screens/labour/labour_list.dart';
import 'package:service_app/utilities/utilities.dart';

class AllServices extends StatefulWidget {
  const AllServices({
    super.key,
  });

  @override
  State<AllServices> createState() => _AllServicesState();
}

class _AllServicesState extends State<AllServices> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Services',
                        style: GoogleFonts.oswald(
                            fontWeight: FontWeight.bold, fontSize: 40)),
                  ),
                ),
                Container(
                  height: 200,
                  width: 200,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/images/van.png"),
                          fit: BoxFit.cover)),
                ),
              ],
            ),
            StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('services')
                    .snapshots(),
                builder: (context, snapshot) {
                  return ListView.separated(
                    itemCount: snapshot.data!.docs.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) {
                      final document = snapshot.data!.docs[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      LabourList(job: document['service']),
                                  fullscreenDialog: true));
                        },
                        child: Container(
                          width: 200,
                          height: 120,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              image: DecorationImage(
                                  image: NetworkImage(
                                    document['cover'],
                                  ),
                                  fit: BoxFit.cover)),
                          child: Container(
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                    colors: [
                                  Colors.white.withOpacity(0),
                                  theme_color
                                ],
                                    begin: Alignment.topRight,
                                    end: Alignment.bottomLeft)),
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: ListTile(
                                title: Text(
                                  document['service'].toString().toUpperCase(),
                                  style: GoogleFonts.oswald(
                                      fontWeight: FontWeight.w900,
                                      fontSize: 28),
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return space;
                    },
                  );
                }),
          ],
        ),
      ),
    );
  }
}
