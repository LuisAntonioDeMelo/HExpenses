import 'package:flutter/material.dart';

class TransactionForm extends StatelessWidget {
  final titleControler = TextEditingController();
  final valueControler = TextEditingController();

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
              decoration: InputDecoration(
                labelText: 'Titulo',
                labelStyle: TextStyle(color: Colors.purple),
              ),
            ),
            TextField(
              controller: valueControler,
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
              onPressed: () => {
                print(
                    '@titulo: ${titleControler.text} \n @valor ${valueControler.text} '),
                titleControler.text = '',
                valueControler.text = ''
              },
            )
          ],
        ),
      ),
    );
  }
}
