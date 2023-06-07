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
//
