import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:service_app/screens/services/subservicelist.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  List<dynamic> availableCategories = [];
  List<dynamic> filteredCategories = [];
  TextEditingController productcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                    controller: productcontroller,
                    onChanged: filterCategory,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.search),
                      suffixIcon: IconButton(
                          onPressed: () {}, icon: const Icon(Icons.cancel)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: const BorderSide(color: Colors.black)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: const BorderSide(color: Colors.black)),
                    )),
              ),
              StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection('services')
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      log(snapshot.error.toString());
                    } else if (snapshot.connectionState ==
                        ConnectionState.waiting) {
                      return const Center(child: LinearProgressIndicator());
                    }
                    availableCategories = snapshot.data!.docs;
                    return ListView.separated(
                      shrinkWrap: true,
                      itemCount: filteredCategories.length,
                      separatorBuilder: (context, index) => const Divider(),
                      itemBuilder: (context, index) {
                        final document = filteredCategories[index];
                        return ListTile(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SubServiceList(
                                        service: document['service']),
                                    fullscreenDialog: true));
                          },
                          leading: CircleAvatar(
                            radius: 30,
                            backgroundImage: NetworkImage(document['cover']),
                          ),
                          title: Text(document['service']),
                        );
                      },
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }

  void filterCategory(String query) {
    setState(() {
      filteredCategories = availableCategories.where((doc) {
        String category = doc.data()['service'].toLowerCase();
        String searchLower = query.toLowerCase();
        return category.contains(searchLower);
      }).toList();
    });
  }
}
