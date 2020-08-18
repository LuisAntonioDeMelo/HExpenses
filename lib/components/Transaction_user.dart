import 'package:Hexpenses/models/Transacao.dart';
import 'package:flutter/material.dart';

import 'Transaction_form.dart';
import 'Transaction_list.dart';

class TransactionUser extends StatefulWidget {
  @override
  _TransactionUserState createState() => _TransactionUserState();
}

class _TransactionUserState extends State<TransactionUser> {
  @override
  Widget build(BuildContext context) {
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

    return Column(
      children: <Widget>[
        TransactionList(transactions),
        TransactionForm(),
      ],
    );
  }
}
