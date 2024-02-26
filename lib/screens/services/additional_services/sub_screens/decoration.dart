import 'package:flutter/material.dart';

class DecorationService extends StatefulWidget {
  const DecorationService({super.key});

  @override
  State<DecorationService> createState() => _DecorationServiceState();
}

class _DecorationServiceState extends State<DecorationService> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("decoration"),
      ),
    );
  }
}
