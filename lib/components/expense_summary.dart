import 'package:expense_app/bar%20graph/bar_graph.dart';
import 'package:expense_app/data/expense_data.dart';
import 'package:expense_app/datetime/date_time_helper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ExpenseSummary extends StatelessWidget {
  final DateTime startOfweek;
   const ExpenseSummary({super.key, required this.startOfweek});

   // calculate the max amount
   double ExpenseMax(
  ExpenseData value,
   String sunday,
   String monday,
   String tuesday,
   String wednesday,
   String thursday,
   String friday,
   String saturday){
    double? max =100;
    List<double> values=[
      value.calculateDailyExpenseSummary()[sunday] ?? 0,
      value.calculateDailyExpenseSummary()[monday] ?? 0,
      value.calculateDailyExpenseSummary()[tuesday] ?? 0,
      value.calculateDailyExpenseSummary()[wednesday] ?? 0,
      value.calculateDailyExpenseSummary()[thursday] ?? 0,
      value.calculateDailyExpenseSummary()[friday] ?? 0,
      value.calculateDailyExpenseSummary()[saturday] ?? 0,
      
      
    ];
    // sort form smallest to largest
    values.sort();
    // get the largest amount at the end of the list and increase the cap slightly
    max=values.last *1.1;

    return max ==0 ? 500 :max;
    

   }

   // calculate total weekly expenses
   String weeklyExpense(
  ExpenseData value,
   String sunday,
   String monday,
   String tuesday,
   String wednesday,
   String thursday,
   String friday,
   String saturday){
    // ignore: unused_local_variable
    double? max =100;
    List<double> values=[
      value.calculateDailyExpenseSummary()[sunday] ?? 0,
      value.calculateDailyExpenseSummary()[monday] ?? 0,
      value.calculateDailyExpenseSummary()[tuesday] ?? 0,
      value.calculateDailyExpenseSummary()[wednesday] ?? 0,
      value.calculateDailyExpenseSummary()[thursday] ?? 0,
      value.calculateDailyExpenseSummary()[friday] ?? 0,
      value.calculateDailyExpenseSummary()[saturday] ?? 0,
      
      
    ];
    double total=0;
    for(int i=0;i<values.length;i++){
      total += values[i];
    }
    return total.toStringAsFixed(2);
   }


  @override
  Widget build(BuildContext context) {
    //get yyyymmdd for the week
    String sunday =convertDateTimetoString(startOfweek.add(const Duration(days: 0)));
    String monday =convertDateTimetoString(startOfweek.add(const Duration(days: 1)));
    String tuesday =convertDateTimetoString(startOfweek.add(const Duration(days: 2)));
    String wednesday =convertDateTimetoString(startOfweek.add(const Duration(days: 3)));
    String thursday =convertDateTimetoString(startOfweek.add(const Duration(days: 4)));
    String friday =convertDateTimetoString(startOfweek.add(const Duration(days: 5)));
    String saturday =convertDateTimetoString(startOfweek.add(const Duration(days: 6)));
    return Consumer<ExpenseData>(
      builder: (context ,value ,child)=>Column(
        children: [

          // week's total
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children:  [
                Text("Week's Total: ",style: TextStyle(fontWeight: FontWeight.bold),),
                Text("₹${weeklyExpense(value, sunday, monday, tuesday, wednesday, thursday, friday, saturday)}"),
              ],
            ),
          ),

          //bar graph
          SizedBox(
            height: 200,
            child: BarGraph(
              sunamount: value.calculateDailyExpenseSummary()[sunday]??0, 
              monamount: value.calculateDailyExpenseSummary()[monday]??0,
              tueamount: value.calculateDailyExpenseSummary()[tuesday]??0, 
              wedamount: value.calculateDailyExpenseSummary()[wednesday]??0, 
              thuamount: value.calculateDailyExpenseSummary()[thursday]??0, 
              friamount: value.calculateDailyExpenseSummary()[friday]??0, 
              satamount: value.calculateDailyExpenseSummary()[saturday]??0, 
              maxY: ExpenseMax(value, sunday, monday, tuesday, wednesday, thursday, friday, saturday)),
          ),
        ],
      ));
  }
}