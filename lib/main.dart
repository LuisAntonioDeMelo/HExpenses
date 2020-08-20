import 'dart:math';

import 'package:Hexpenses/components/Transaction_chart.dart';
import 'package:Hexpenses/components/Transaction_form.dart';
import 'package:flutter/material.dart';

import 'components/Transaction_list.dart';
import 'models/Transacao.dart';

void main() {
  runApp(HExpenses());
}

class HExpenses extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
      theme: ThemeData(
        textTheme: ThemeData.light().textTheme.copyWith(
              headline6: TextStyle(
                fontFamily: 'OpenSans',
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
        primarySwatch: Colors.purple,
        accentColor: Colors.amber[500],
        fontFamily: 'Quicksand',
        appBarTheme: AppBarTheme(
            textTheme: ThemeData.light().textTheme.copyWith(
                  headline6: TextStyle(
                      fontFamily: 'OpenSans',
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                )),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Transaction> _transactions = [
    Transaction(
      id: Random().nextInt(50).toString(),
      title: 'Conta de Internet',
      value: 150.00,
      date: DateTime.now().subtract(Duration(days: 3)),
    ),
    Transaction(
      id: Random().nextInt(50).toString(),
      title: 'Novo Game ',
      value: 200.00,
      date: DateTime.now().subtract(Duration(days: 4)),
    ),
  ];

  void _openFormModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => TransactionForm(_addTransaction),
    );
  }

  List<Transaction> get _recentTransation {
    return _transactions
        .where((tr) => tr.date.isAfter(DateTime.now().subtract(
              Duration(days: 7),
            )))
        .toList();
  }

  _addTransaction(String title, double value) {
    final newTransaction = new Transaction(
      id: Random().nextDouble().toString(),
      title: title,
      value: value,
      date: DateTime.now(),
    );

    //adicionando um novo estado na lista de transações
    setState(() {
      _transactions.add(newTransaction);
    });

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Despesas Pessoais')),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => _openFormModal(context),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TransactionChart(_recentTransation),
            TransactionList(_transactions),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _openFormModal(context),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
