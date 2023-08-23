import 'package:expense_tracker/datetime/date_time_helper.dart';
import 'package:expense_tracker/models/expense_item.dart';

class ExpenseData {

  //list of expense
  List<ExpenseItem> overallExpenseList = [];


  //get expense lst
  List<ExpenseItem> getAllExpenseList() {
    return overallExpenseList;
  }

  //add expense
  void addNewExpense(ExpenseItem newExpense) {
    overallExpenseList.add(newExpense);
  }

  //delete expense
  void deleteExpense(ExpenseItem expense) {
    overallExpenseList.remove(expense);
  }

  //get weekday from a datetime object
  String getDayName(DateTime dateTime) {
    switch (dateTime.weekday) {
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

  //get the date for start of week
  DateTime startOfWeekDate() {
    DateTime? startOfWeek;

    //get today date
    DateTime today = DateTime.now();

    //go backward from today to find sunday
    for(int i=0;i<7;i++) {
      if(getDayName(today.subtract(Duration(days: i)))=='Sun') {
        startOfWeek = today.subtract(Duration(days: i));
      }
    }
    return startOfWeek!;

  }

  /*

  convert list of expense into a daily expense summary

  Daily expense summary
  */
  Map<String, double> calculateDailyExpenseSummary() {
    Map<String, double> dailyExpenseSummary = {

    };
    for(var expense in overallExpenseList) {
      String date = convertDateTimeToString(expense.dateTime);
      double amount = double.parse(expense.amount);

      if(dailyExpenseSummary.containsKey(date)) {
        double currentAmount = dailyExpenseSummary[date]!;
        currentAmount += amount;
        dailyExpenseSummary[date] = currentAmount;
      }else {
        dailyExpenseSummary.addAll({date:amount});
      }
    }
    return dailyExpenseSummary;
  }
}