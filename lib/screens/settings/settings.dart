// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:service_app/utilities/list.dart';
import 'package:service_app/utilities/utilities.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: CircleAvatar(
                radius: 60,
              ),
            ),
            space,
            ListView.builder(
              shrinkWrap: true,
              itemCount: 5,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Card(
                    elevation: 10,
                    child: SizedBox(
                      height: 60,
                      child: ListTile(
                        title: Text(settings[index]),
                        subtitle: Text(settingsub[index]),
                        trailing: settingsIcon[index],
                      ),
                    ),
                  ),
                );
              },
              // separatorBuilder: (BuildContext context, int index) {
              //   return Divider();
              // },
            ),
          ],
        ),
      ),
    );
  }
}
