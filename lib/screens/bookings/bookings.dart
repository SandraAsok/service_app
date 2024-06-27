// import 'package:flutter/material.dart';
// import 'package:webview_flutter/webview_flutter.dart';

// class MyBookings extends StatefulWidget {
//   const MyBookings({super.key});

//   @override
//   State<MyBookings> createState() => _MyBookingsState();
// }

// class _MyBookingsState extends State<MyBookings> {
//   final controller = WebViewController()
//     ..setJavaScriptMode(JavaScriptMode.disabled)
//     ..loadRequest(Uri.parse(
//         "https://newsapi.org/v2/everything?q=tesla&from=2024-05-24&sortBy=publishedAt&apiKey=5e1462beaa764c4f8531415234dd5328"));

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: WebViewWidget(controller: controller),
//     );
//   }
// }
