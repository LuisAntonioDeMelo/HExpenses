import 'package:Hexpenses/components/Transaction_user.dart';
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
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Despesas Pessoais')),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              child: Card(
                color: Colors.blue,
                elevation: 5,
                child: Text('Graficos'),
              ),
            ),
            TransactionUser()
          ],
        ),
      ),
    );
  }
}
