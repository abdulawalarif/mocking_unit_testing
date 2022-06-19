import 'package:flutter/material.dart';
import 'package:unit_test_and_mocking/screens/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
      theme: ThemeData.dark(),
    );
  }
}
