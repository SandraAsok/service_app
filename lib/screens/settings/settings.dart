import 'package:flutter/material.dart';
import 'package:service_app/utilities/utilities.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Container(
                  height: 200,
                  width: 200,
                  decoration:
                      BoxDecoration(border: Border.all(color: Colors.purple)),
                  child: Center(child: Text("logo")),
                ),
              ),
              space,
              ListView(
                shrinkWrap: true,
                children: const [
                  SizedBox(height: 10),
                  Padding(
                    padding: EdgeInsets.all(3.0),
                    child: Card(
                      elevation: 10,
                      child: SizedBox(
                        height: 60,
                        child: ListTile(
                          title: Text('Help Center'),
                          trailing: Icon(Icons.support_agent),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: EdgeInsets.all(3.0),
                    child: Card(
                      elevation: 10,
                      child: SizedBox(
                        height: 60,
                        child: ListTile(
                          title: Text('About'),
                          trailing: Icon(Icons.info),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: EdgeInsets.all(3.0),
                    child: Card(
                      elevation: 10,
                      child: SizedBox(
                        height: 60,
                        child: ListTile(
                          title: Text('Privacy Policy'),
                          trailing: Icon(Icons.lock),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: EdgeInsets.all(3.0),
                    child: Card(
                      elevation: 10,
                      child: SizedBox(
                        height: 60,
                        child: ListTile(
                          title: Text('Terms and Conditions'),
                          trailing: Icon(Icons.library_add_check),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: EdgeInsets.all(3.0),
                    child: Card(
                      elevation: 10,
                      child: SizedBox(
                        height: 60,
                        child: ListTile(
                          title: Text('Log out'),
                          trailing: Icon(Icons.logout),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
