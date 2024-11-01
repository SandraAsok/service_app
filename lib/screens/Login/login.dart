// ignore_for_file: unnecessary_null_comparison

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

  bool _obscureText = true;

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  String? errorMessage;

  bool validateEmail(String value) {
    if (value.isEmpty) {
      setState(() {
        errorMessage = 'Please enter your email';
      });
      return false;
    }
    // Regular expression for validating an email
    final regex = RegExp(r'^[^@]+@[^@]+\.[^@]+$');
    if (!regex.hasMatch(value)) {
      setState(() {
        errorMessage = 'Please enter a valid email address';
      });
      return false;
    }
    setState(() {
      errorMessage = null;
    });
    return true;
  }

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
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
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
                      child: TextFormField(
                        controller: _email,
                        onChanged: validateEmail,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                            label: Text('Email', style: black_style),
                            hintText: 'Type Here',
                            errorText: errorMessage,
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
                        obscureText: _obscureText,
                        decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.lock),
                            label: Text('Password', style: black_style),
                            hintText: 'Type Here',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20)),
                            suffixIcon: IconButton(
                              icon: Icon(_obscureText
                                  ? Icons.visibility
                                  : Icons.visibility_off),
                              onPressed: _togglePasswordVisibility,
                            )),
                      ),
                    ),
                    space,
                    ElevatedButton(
                        onPressed: () async {
                          final SharedPreferences sharedPreferences =
                              await SharedPreferences.getInstance();
                          sharedPreferences.setBool('email', true);

                          signup();
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text("Account created successfully")));
                        },
                        style: ButtonStyle(
                            side: MaterialStatePropertyAll<BorderSide>(
                                BorderSide(color: theme_color)),
                            fixedSize: const MaterialStatePropertyAll<Size>(
                                Size.fromHeight(50)),
                            textStyle: MaterialStatePropertyAll<TextStyle>(
                                button_style)),
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
        ),
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
  bool _obscureText = true;

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  String? errortext;

  bool validateloginEmail(String value) {
    if (value.isEmpty) {
      setState(() {
        errortext = 'Please enter your email';
      });
      return false;
    }
    final regex = RegExp(r'^[^@]+@[^@]+\.[^@]+$');
    if (!regex.hasMatch(value)) {
      setState(() {
        errortext = 'Please enter a valid email address';
      });
      return false;
    }
    setState(() {
      errortext = null;
    });
    return true;
  }

  Future<void> _resetPassword() async {
    if (!validateloginEmail(email.text)) return;

    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email.text);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Password reset link sent to ${email.text}"),
        backgroundColor: Colors.green,
      ));
    } catch (e) {
      log("Error resetting password: $e");
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Error: Unable to send reset email"),
        backgroundColor: Colors.red,
      ));
    }
  }

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
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
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
                      child: TextFormField(
                        controller: email,
                        onChanged: validateloginEmail,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.person),
                            label: const Text('Email'),
                            hintText: 'Type Here',
                            errorText: errortext,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20))),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        controller: password,
                        obscureText: _obscureText,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.lock),
                          label: const Text('Password'),
                          hintText: 'Type Here',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20)),
                          suffixIcon: IconButton(
                            icon: Icon(_obscureText
                                ? Icons.visibility
                                : Icons.visibility_off),
                            onPressed: _togglePasswordVisibility,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextButton(
                      onPressed: _resetPassword,
                      child: Text(
                        "Forgot Password?",
                        style: TextStyle(color: theme_color),
                      ),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                        onPressed: () async {
                          final SharedPreferences sharedPreferences =
                              await SharedPreferences.getInstance();
                          sharedPreferences.setBool('email', true);
                          signin();
                        },
                        style: ButtonStyle(
                            side: MaterialStatePropertyAll<BorderSide>(
                                BorderSide(color: theme_color)),
                            fixedSize: const MaterialStatePropertyAll<Size>(
                                Size.fromHeight(50)),
                            textStyle: MaterialStatePropertyAll<TextStyle>(
                                hint_style)),
                        child: const Text("Sign In")),
                    const SizedBox(height: 20),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
