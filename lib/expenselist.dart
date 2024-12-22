import 'package:expense_tracker/models/Expense.dart';
import 'package:expense_tracker/widget.dart';
import 'package:flutter/material.dart';

class Expenselist extends StatelessWidget {
  const Expenselist(this.expenses, {super.key, required this.onRemoveExpense});

  final void Function(Expense expense) onRemoveExpense;
  final List<Expense> expenses;

  @override
  Widget build(context) {
    

    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (ctx, index) => Dismissible(
        onDismissed: (direction) {
          onRemoveExpense(expenses[index]);
        },
        key: ValueKey(expenses[index]),
        child: ExpenseItem(expenses[index]),
      ),
    );
  }
}
