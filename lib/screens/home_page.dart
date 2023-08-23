import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final newExpenseNameController = TextEditingController();
  final newExpenseAmountContoller = TextEditingController();



  void addNewExpense() {
    showDialog(context: context, builder: (context)=>
      AlertDialog(
        title: Text("Add new Expense"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            
            TextField(
              //name
              controller: newExpenseNameController,

            ),
            TextField(
              //amount
              controller: newExpenseAmountContoller,

            )
          ],
        ),
        actions: [
            MaterialButton(
              onPressed: save,
              child: Text("Save"),
            ),
            MaterialButton(
              onPressed: cancel,
              child: Text("Cancel"),
            ),
        ],
      )
    );
  }

  void save() {

  }
  void cancel() {
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      floatingActionButton: FloatingActionButton(
        onPressed: addNewExpense,
        child: Icon(Icons.add),
        ),
    );
  }
}
