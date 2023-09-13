import 'package:expense_app/data/hive_database.dart';
import 'package:expense_app/datetime/date_time_helper.dart';
import 'package:expense_app/pages/models/expense_item.dart';
import 'package:flutter/material.dart';

class ExpenseData extends ChangeNotifier{
  // list of all expenses
  List<ExpenseItem> overallExpenseList =[];

  // get expense list
  List<ExpenseItem> getExpenseList(){
    return overallExpenseList;
  }

  //perpare to display the data
  final db =HiveDatabase();
  void perpareData(){
    if(db.readData().isNotEmpty){
       overallExpenseList =db.readData();
    }
  }
  // add new expense item 
  void addNewExpense(ExpenseItem newExpense){
    overallExpenseList.add(newExpense);
    db.saveData(overallExpenseList);
    notifyListeners();
  }
  // remove new expense item
  void delteNewExpense(ExpenseItem expense){
    overallExpenseList.remove(expense);
    db.saveData(overallExpenseList);
    notifyListeners();
  }
  // get weekday from datetime
  String getDayName( DateTime dateTime){
    switch (dateTime.weekday){
      case 1:
      return "Mon";
      case 2:
      return "Tue";
      case 3:
      return "Wed";
      case 4:
      return "Thu";
      case 5:
      return "Fri";
      case 6:
      return "Sat";
      case 7:
      return "Sun";
      default:
      return "";
      }
  }
  // get the date for the start of the week 
  DateTime startOfWeekDay() {
    DateTime? startOfWeek;

    // get today's date
    DateTime today = DateTime.now();

    // find sunday from today's date by going back
    for(int i=0;i<7;i++){
      if(getDayName(today.subtract(Duration(days : i)))== "Sun"){
        startOfWeek= today.subtract(Duration(days : i));
      }
    }
    return startOfWeek!;
  }

  Map<String , double> calculateDailyExpenseSummary(){
    Map<String , double> dailyExpensesSummary={

    };
    for(var expense in overallExpenseList){
      String date = convertDateTimetoString(expense.dateTime);
      double amount = double.parse(expense.amount);

      if(dailyExpensesSummary.containsKey(date)){
        
        double currentAmount = dailyExpensesSummary[date]!;
        currentAmount +=  amount;
        dailyExpensesSummary[date] =currentAmount;
      }
      else 
      {
        dailyExpensesSummary.addAll({date : amount});
      }
    }
    return dailyExpensesSummary;
  }
}