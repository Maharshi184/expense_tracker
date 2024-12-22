import 'package:expense_tracker/Chart.dart';
import 'package:expense_tracker/New_expense.dart';
import 'package:expense_tracker/expenselist.dart';
import 'package:expense_tracker/models/Expense.dart';
import 'package:flutter/material.dart';

class expense extends StatefulWidget {
  const expense({super.key});

  @override
  State<expense> createState() {
    return _expense();
  }
}

class _expense extends State<expense> {
  final List<Expense> expense1 = [
    Expense(
        amount: 15.00,
        date: DateTime.now(),
        name: 'Auto',
        catagory: Catagory.food),
    Expense(
        amount: 90.00,
        date: DateTime.now(),
        name: 'Pizza',
        catagory: Catagory.food),
    Expense(
        amount: 45.00,
        date: DateTime.now(),
        name: 'Bus',
        catagory: Catagory.travel),
    Expense(
        amount: 180.00,
        date: DateTime.now(),
        name: 'Movie',
        catagory: Catagory.leisure)
  ];

  void _addNewExpense(Expense expense) {
    setState(() {
      expense1.add(expense);
    });
  }

  void _removeExpense(Expense expense) {
    final index = expense1.indexOf(expense);

    setState(() {
      expense1.remove(expense);
    });

    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: Duration(seconds: 3),
        content: Text('expense deleted'),
        action: SnackBarAction(
            label: 'undo',
            onPressed: () {
              expense1.insert(index, expense);
            }),
      ),
    );
  }

  void _addexpence() {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (ctx) => NewExpense(
              onAddExpense: _addNewExpense,
            ));
  }

  @override
  Widget build(BuildContext context) {
    print(MediaQuery.of(context).size.width);
    var width = MediaQuery.of(context).size.width;

    Widget mainContent = const Center(
        child: Text(
      'currrently No Expenses are there',
      style: TextStyle(fontSize: 14),
    ));

    if (expense1.isNotEmpty) {
      mainContent = Expenselist(expense1, onRemoveExpense: _removeExpense);
    }

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          
          title: const Text(
            'Expense Tracker',
            style: TextStyle(fontSize: 16),
          ),
          actions: [
            IconButton(
              icon: (const Icon(Icons.add)),
              onPressed: _addexpence,
            ),
          ],
        ),
        body: width < 600
            ? Column(
                children: [
                  Chart(expenses: expense1),
                  Expanded(
                    child: mainContent,
                  ),
                ],
              )
            : Row(
                children: [
                  Expanded(
                    child: Chart(expenses: expense1),
                  ),
                  Expanded(
                    child: mainContent,
                  ),
                ],
              ),
      ),
    );
  }
}
