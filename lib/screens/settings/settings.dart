import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:service_app/screens/Login/login.dart';
import 'package:service_app/screens/settings/popup.dart';
import 'package:service_app/utilities/utilities.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

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
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    height: 200,
                    width: 200,
                    decoration:
                        BoxDecoration(border: Border.all(color: Colors.purple)),
                    child: const Center(child: Text("logo")),
                  ),
                ),
                space,
                ListView(
                  shrinkWrap: true,
                  children: [
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Card(
                        elevation: 10,
                        child: SizedBox(
                          height: 60,
                          child: GestureDetector(
                            onTap: () async {
                              final String email_address =
                                  "azserviceofficial@gmail.com";
                              final String subject = "Any queries? ";
                              final Uri email_launchUri = Uri(
                                  scheme: 'mailto',
                                  path: email_address,
                                  queryParameters: {
                                    'subject': subject,
                                  });

                              if (await canLaunchUrl(email_launchUri)) {
                                await launchUrl(email_launchUri);
                              }
                            },
                            child: const ListTile(
                              title: Text('Help Center'),
                              trailing: Icon(Icons.support_agent),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Card(
                        elevation: 10,
                        child: SizedBox(
                          height: 60,
                          child: GestureDetector(
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: const Text("About"),
                                    content: const Text(
                                      "\"A2Z Service\" is your all-in-one solution for home maintenance and repairs. From plumbing and electrical work to cleaning and gardening, our app connects you with skilled professionals for all your home service needs. Easily book appointments, make secure payments, and enjoy peace of mind with real-time updates and reliable customer support. Simplify your life with \"A2Z Service\" today.",
                                      style: TextStyle(fontSize: 16),
                                    ),
                                    actions: [
                                      TextButton(
                                          onPressed: () =>
                                              Navigator.pop(context),
                                          child: const Text("Ok"))
                                    ],
                                  );
                                },
                              );
                            },
                            child: const ListTile(
                              title: Text('About'),
                              trailing: Icon(Icons.info),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Card(
                        elevation: 10,
                        child: SizedBox(
                          height: 60,
                          child: GestureDetector(
                            onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SettingPopup(
                                      mdFilename: 'privacypolicy.md'),
                                )),
                            child: const ListTile(
                              title: Text('Privacy Policy'),
                              trailing: Icon(Icons.lock),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Card(
                        elevation: 10,
                        child: SizedBox(
                          height: 60,
                          child: GestureDetector(
                            onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SettingPopup(
                                      mdFilename: 'termsandconditions.md'),
                                )),
                            child: const ListTile(
                              title: Text('Terms and Conditions'),
                              trailing: Icon(Icons.library_add_check),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Card(
                        elevation: 10,
                        child: SizedBox(
                          height: 60,
                          child: GestureDetector(
                            onTap: () async {
                              showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  content: Text("are you sure ?"),
                                  actions: [
                                    TextButton(
                                        onPressed: () {}, child: Text("No")),
                                    TextButton(
                                      onPressed: () async {
                                        await FirebaseAuth.instance.signOut();
                                        final SharedPreferences
                                            sharedPreferences =
                                            await SharedPreferences
                                                .getInstance();
                                        sharedPreferences.setBool(
                                            'email', false);
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: ((context) =>
                                                    SignUp())));
                                      },
                                      child: Text("yes"),
                                    ),
                                  ],
                                ),
                              );
                            },
                            child: const ListTile(
                              title: Text('Log out'),
                              trailing: Icon(Icons.logout),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
