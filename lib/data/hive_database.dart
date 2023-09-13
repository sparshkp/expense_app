import 'package:expense_app/pages/models/expense_item.dart';
import 'package:hive/hive.dart';

class HiveDatabase{

  // reference our box in main function
  final _myBox = Hive.box("expense_database");

  // write data
  void saveData(List<ExpenseItem> allExpense){
    List<List<dynamic>> allExpensesFormatted=[];

    
    for(var expense in allExpense){
    // convert each expense item into a list of storable types(strings,datetime)
    List<dynamic> expenseFormatted=[
      expense.name,
      expense.amount,
      expense.dateTime,
    ];
    allExpensesFormatted.add(expenseFormatted);
    }
    // store the data in database
    _myBox.put("All_Expense", allExpensesFormatted);

  }


  // read data
  List<ExpenseItem> readData(){
    List savedExpenses =_myBox.get("All_Expense") ??[];
    List<ExpenseItem> allExpenses=[];

    for(int i=0;i<savedExpenses.length;i++){
      // collect individual expenseData
      String name =savedExpenses[i][0];
      String amount =savedExpenses[i][1];
      DateTime datetime =savedExpenses[i][2];

      // create expense item
      ExpenseItem expense=ExpenseItem(
        name: name, 
        amount: amount, 
        dateTime: datetime
        );
        // add expense to overall list of expenses
        allExpenses.add(expense);
    
    }
    return allExpenses;

  }
}