import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

// ignore: must_be_immutable
class ExpenseTile extends StatelessWidget {
  final String name;
  final String amount;
  final DateTime dateTime;
  void Function(BuildContext)? deleteTapped;


   ExpenseTile({super.key, 
  required this.name, 
  required this.amount, 
  required this.dateTime,
  required this.deleteTapped});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8,left: 10,right: 10),
      child: Slidable(
        endActionPane: ActionPane(
      motion:  const StretchMotion(), 
      children: [
        // delete button 
        SlidableAction(
          onPressed: deleteTapped,
          icon: Icons.delete,
          backgroundColor: Colors.red,
          borderRadius: BorderRadius.circular(10),
          )
      ]),
        child: Card(
          color: Colors.grey[200],
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: ListTile(title: Text(name),
                subtitle: Text("${dateTime.day} / ${dateTime.month} / ${dateTime.year}"),
                trailing: Text('₹$amount'),
                ),
        ),
      ),
    );}
}