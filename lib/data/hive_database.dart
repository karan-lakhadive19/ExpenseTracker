import 'package:hive/hive.dart';

import '../models/expense_item.dart';

class HiveDataBase {
  //  reference our box
  final _myBox = Hive.box("expense_database");

  //  write data
  void saveData(List<ExpenseItem> allExpense) {
    List<List<dynamic>> allExpenseFormatted = [];
    for(var expense in allExpense) {
      List<dynamic> expenseFormatted = [
        expense.name,
        expense.amount,
        expense.dateTime
      ];
      allExpenseFormatted.add(expenseFormatted);
    }

    _myBox.put("ALL_EXPENSES", allExpenseFormatted);
  }


  //  read data
  List<ExpenseItem> readData() {
    List savedExpenses = _myBox.get("ALL_EXPENSES") ?? [];
    List<ExpenseItem> allExpense = [];
    for(int i = 0; i<savedExpenses.length; i++) {
      // collect expense data
      String name = savedExpenses[i][0];
      String amount = savedExpenses[i][1];
      DateTime dateTime = savedExpenses[i][2];

      // create expense item
      ExpenseItem expense = ExpenseItem(name: name, amount: amount, dateTime: dateTime);

      // add expense to overall expense
      allExpense.add(expense);
    }
    return allExpense;
  }
}