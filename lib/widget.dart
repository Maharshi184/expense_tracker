import 'package:expense_tracker/models/Expense.dart';
import 'package:flutter/material.dart';

class ExpenseItem extends StatelessWidget {
  ExpenseItem(this.expense, {super.key});

  final Expense expense;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 20,
          horizontal: 16,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(expense.name),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Text(
                  'Rs.${expense.amount.toStringAsFixed(2)}',
                ),
                const Spacer(),
                Row(
                  children: [
                    Icon(icons[expense.catagory]),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(expense.getDate),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
