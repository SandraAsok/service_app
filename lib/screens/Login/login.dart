import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:service_app/main.dart';
import 'package:service_app/utilities/utilities.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
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
                    onPressed: () {},
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
                    onTap: () {},
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

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
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
                    onPressed: () {
                      Navigator.push(
                          context,
                          CupertinoPageRoute(
                            builder: (context) => const BottomNav(),
                          ));
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
