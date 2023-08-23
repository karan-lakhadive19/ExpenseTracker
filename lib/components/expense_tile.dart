import 'package:flutter/material.dart';

class ExpenseTile extends StatelessWidget {
  String name;
  String amount;
  DateTime dateTime;

  ExpenseTile(
      {super.key,
      required this.name,
      required this.amount,
      required this.dateTime});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(name),
      subtitle: Text('${dateTime.day}/${dateTime.month}/${dateTime.year}'),
      trailing: Text('₹'+amount),
    );
  }
}
