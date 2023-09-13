

import 'package:expense_app/components/expense_summary.dart';
import 'package:expense_app/components/expense_tile.dart';
import 'package:expense_app/data/expense_data.dart';
import 'package:expense_app/pages/models/expense_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}
// add new expense

class _HomePageState extends State<HomePage> {

final newExpenseNameController = TextEditingController();
final newExpenseAmountController = TextEditingController();



@override
  void initState() {
    // perpare data on startup
    Provider.of<ExpenseData>(context ,listen: false).perpareData();
    super.initState();
  }
void addNewExpense(){
showDialog(
  context: context, 
  builder: (context)=>AlertDialog(
   title: Text("Add a new expense"),
   content: Column(
    mainAxisSize: MainAxisSize.min,
    children:  [
    // to add expense name
    TextField(
      controller: newExpenseNameController,
      decoration: InputDecoration(
        hintText: "Enter Expense",
      ),
    ),

    // to add new amoount
    TextField(
      controller: newExpenseAmountController,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        hintText: "Enter amount in ₹",
        
      ),
    )
   ],
   ),
   actions: [
    // save button
    MaterialButton(
      onPressed: save,
      child: Text("Save"),
      ),
      // cancel button
      MaterialButton(
      onPressed: cancel,
      child: Text("Cancel"),
      ),

   ],
   
  )
  );
}
// save button
void save(){
  // create expenseItem
  if(newExpenseAmountController.text.isNotEmpty && newExpenseNameController.text.isNotEmpty){
    ExpenseItem newExpense =ExpenseItem(
    amount: newExpenseAmountController.text,
    name: newExpenseNameController.text,
    dateTime: DateTime.now()
    );
    // add a new expense
Provider.of<ExpenseData>(context,listen: false).addNewExpense(newExpense);
Navigator.pop(context);
clear();
  }
}
// cancel button
void cancel(){
Navigator.pop(context);
clear();
}
void clear(){
  newExpenseAmountController.clear();
  newExpenseNameController.clear();
}
// delte expense
void deleteExpense( ExpenseItem expense){
  Provider.of<ExpenseData>(context,listen: false).delteNewExpense(expense);
}

  @override
  Widget build(BuildContext context) {
    return Consumer<ExpenseData>(builder: (context ,value ,child)=>Scaffold(
      backgroundColor: Colors.grey[300],
  
      floatingActionButton: FloatingActionButton(
        onPressed: addNewExpense,
        backgroundColor: Colors.black,
        child: Icon(Icons.add),
        ),
        body: ListView(children: [
          //weekly summary
          SizedBox(
            height: 40,
          ),
           ExpenseSummary(startOfweek: value.startOfWeekDay()),

          // expenses list
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
          itemCount: value.getExpenseList().length,
          itemBuilder: (context, index)=>ExpenseTile(
            name: value.getExpenseList()[index].name,
            deleteTapped: (p0) => deleteExpense(value.getExpenseList()[index]), 
            amount: value.getExpenseList()[index].amount, 
            dateTime: value.getExpenseList()[index].dateTime)
        ),
        ],))
    );
  }
}