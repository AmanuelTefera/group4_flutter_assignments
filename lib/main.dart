import 'package:flutter/material.dart';
import 'userinput.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('User Input Forms'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: UserInputForms(),
        ),
      ),
    );
  }
}
// Group Members Name     ID
// 1. elias ..............2552
// 2.henok  ..............1133
// 3.bzawit ..............0435
// 4.yomiyu ..............2265
// 5.amanuel ..............
