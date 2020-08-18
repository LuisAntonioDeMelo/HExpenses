import 'package:flutter/material.dart';

class TransactionForm extends StatelessWidget {
  final titleControler = TextEditingController();
  final valueControler = TextEditingController();

  final void Function(String title, double value) onSubmit;

  TransactionForm(this.onSubmit);

  void _onSubmit() {
    final title = titleControler.text;
    final value = double.tryParse(valueControler.text) ?? 0;

    if (title.isEmpty || value <= 0) {
      return;
    }
    onSubmit(title, value);
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
                labelStyle: TextStyle(color: Colors.purple),
              ),
            ),
            TextField(
              controller: valueControler,
              onSubmitted: (_) => _onSubmit(),
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Valor (R\$)',
                labelStyle: TextStyle(color: Colors.purple),
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
