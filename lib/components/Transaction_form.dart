import 'package:flutter/material.dart';

class TransactionForm extends StatefulWidget {
  final void Function(String title, double value) onSubmit;

  TransactionForm(this.onSubmit);

  @override
  _TransactionFormState createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final titleControler = TextEditingController();
  final valueControler = TextEditingController();

  void _onSubmit() {
    final title = titleControler.text;
    final value = double.tryParse(valueControler.text) ?? 0;

    if (title.isEmpty || value <= 0) {
      return;
    }
    widget.onSubmit(title, value);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              controller: titleControler,
              onSubmitted: (_) => _onSubmit(),
              decoration: InputDecoration(
                labelText: 'Titulo',
                labelStyle: TextStyle(color: Theme.of(context).primaryColor),
              ),
            ),
            TextField(
              controller: valueControler,
              onSubmitted: (_) => _onSubmit(),
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Valor (R\$)',
                labelStyle: TextStyle(color: Theme.of(context).primaryColor),
              ),
            ),
            FlatButton(
                child: Text(
                  'New Transation',
                  style: TextStyle(color: Colors.purple),
                ),
                onPressed: _onSubmit),
          ],
        ),
      ),
    );
  }
}
