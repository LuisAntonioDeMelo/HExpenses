import 'package:Hexpenses/models/Transacao.dart';
import 'package:flutter/material.dart';

import 'Transaction_form.dart';
import 'Transaction_list.dart';

class TransactionUser extends StatefulWidget {
  @override
  _TransactionUserState createState() => _TransactionUserState();
}

class _TransactionUserState extends State<TransactionUser> {
  List<Transaction> transactions = [
    Transaction(
      id: 't1',
      title: 'Novo tenis',
      value: 340.50,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'Pagar conta',
      value: 70,
      date: DateTime.now(),
    )
  ];

  _addTransaction(String title, double value) {
    final newTransaction = new Transaction(
        id: '', title: title, value: value, date: DateTime.now());

    //adicionando um novo estado na lista de transações
    setState(() {
      transactions.add(newTransaction);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TransactionForm(_addTransaction),
        TransactionList(transactions),
      ],
    );
  }
}
