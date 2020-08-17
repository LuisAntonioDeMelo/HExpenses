import 'package:flutter/material.dart';

void main() {
  runApp(HExpenses());
}

class HExpenses extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text('Init version'),
      ),
    );
  }
}
