import 'package:Hexpenses/components/chart_bar.dart';
import 'package:Hexpenses/models/Transacao.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionChart extends StatelessWidget {
  final List<Transaction> recentTransaction;

  TransactionChart(this.recentTransaction);

  List<Map<String, Object>> get groupedTransation {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(
        Duration(days: index),
      );

      double total = 0.0;
      recentTransaction.forEach((tr) {
        if (tr.date.day == weekDay.day &&
            tr.date.month == weekDay.month &&
            tr.date.year == weekDay.year) {
          total += tr.value;
        }
      });

      print(total);
      print(DateFormat.E().format(weekDay)[0]);

      return {
        'day': DateFormat.E().format(weekDay)[0],
        'value': total,
      };
    });
  }

  double get _weekTotalPercentage {
    return groupedTransation.fold(0.0, (sum, tr) => sum += tr['value']);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Row(
        children: groupedTransation.map((tr) {
          return ChartBar(
            label: tr['day'],
            value: tr['value'],
            percentage: (tr['value'] as double) / _weekTotalPercentage,
          );
        }).toList(),
      ),
    );
  }
}
