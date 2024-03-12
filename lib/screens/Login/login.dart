// ignore_for_file: unnecessary_null_comparison, use_build_context_synchronously

import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:service_app/functions/function.dart';
import 'package:service_app/main.dart';
import 'package:service_app/utilities/utilities.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    signup() async {
      try {
        final user = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _email.text,
          password: _password.text,
        );
        if (user != null) {
          Navigator.push(
              context,
              CupertinoPageRoute(
                  builder: (context) => const BottomNav(),
                  fullscreenDialog: true));
        }
      } catch (e) {
        log("ERROR: $e");
      }
    }

    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          Card(
            elevation: 20,
            child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [theme_color, Colors.white],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight),
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(20)),
                height: size.height / 3,
                child: Image.asset('assets/images/welcome.png')),
          ),
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: _email,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        label: Text('Email', style: black_style),
                        hintText: 'Type Here',
                        prefixIcon: const Icon(Icons.person),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(color: theme_color))),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: _password,
                    obscureText: true,
                    decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.lock),
                        label: Text('Password', style: black_style),
                        hintText: 'Type Here',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20))),
                  ),
                ),
                space,
                ElevatedButton(
                    onPressed: () async {
                      final SharedPreferences sharedPreferences =
                          await SharedPreferences.getInstance();
                      sharedPreferences.setString('email', _email.text);
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //       builder: (context) => BottomNav(),
                      //     ));
                      signup();
                    },
                    style: ButtonStyle(
                        side: MaterialStatePropertyAll<BorderSide>(
                            BorderSide(color: theme_color)),
                        fixedSize: const MaterialStatePropertyAll<Size>(
                            Size.fromHeight(50)),
                        textStyle:
                            MaterialStatePropertyAll<TextStyle>(button_style)),
                    child: Text("Create Account", style: hint_style)),
                space,
                Padding(
                  padding: const EdgeInsets.only(left: 100),
                  child: Row(
                    children: [
                      Text("Already a User? ", style: black_style),
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                CupertinoPageRoute(
                                    builder: (context) => const SignIn(),
                                    fullscreenDialog: true));
                          },
                          child: Text("Sign In", style: hint_style))
                    ],
                  ),
                ),
                space,
                const Divider(thickness: 2),
                space,
                Container(
                  width: 250,
                  decoration: BoxDecoration(
                      border: Border.all(color: theme_color),
                      borderRadius: BorderRadius.circular(30)),
                  child: GestureDetector(
                    onTap: () {
                      googleSignIn();
                    },
                    child: Row(
                      children: [
                        const CircleAvatar(
                            radius: 25,
                            backgroundImage:
                                AssetImage('assets/images/google.jpg')),
                        Text(
                          "Continue with Google",
                          style: hint_style,
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

TextEditingController email = TextEditingController();
TextEditingController password = TextEditingController();

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    signin() async {
      try {
        final user = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email.text,
          password: password.text,
        );
        if (user != null) {
          Navigator.push(
              context,
              CupertinoPageRoute(
                builder: (context) => const BottomNav(),
              ));
        }
      } catch (e) {
        log("ERROR : $e");
      }
    }

    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          Card(
            elevation: 30,
            child: Container(
              height: size.height / 3,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: LinearGradient(
                      colors: [theme_color, Colors.white],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight)),
              child: Image.asset('assets/images/welcome.png'),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: email,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.person),
                        label: const Text('Email'),
                        hintText: 'Type Here',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20))),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: password,
                    obscureText: true,
                    decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.lock),
                        label: const Text('Password'),
                        hintText: 'Type Here',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20))),
                  ),
                ),
                space,
                ElevatedButton(
                    onPressed: () async {
                      final SharedPreferences sharedPreferences =
                          await SharedPreferences.getInstance();
                      sharedPreferences.setString('email', email.text);
                      signin();
                    },
                    style: ButtonStyle(
                        side: MaterialStatePropertyAll<BorderSide>(
                            BorderSide(color: theme_color)),
                        fixedSize: const MaterialStatePropertyAll<Size>(
                            Size.fromHeight(50)),
                        textStyle:
                            MaterialStatePropertyAll<TextStyle>(hint_style)),
                    child: const Text("Sign In")),
                space,
              ],
            ),
          )
        ],
      ),
    );
  }
}
