import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

final formater = DateFormat.yMd();

final icons = {
  Catagory.food: Icons.dining,
  Catagory.leisure: Icons.movie,
  Catagory.travel: Icons.airplane_ticket,
  Catagory.work: Icons.work,
};

final uuid = Uuid();

enum Catagory { food, leisure, travel, work }

class Expense {
  Expense(
      {required this.amount,
      required this.date,
      required this.name,
      required this.catagory})
      : id = uuid.v4();

  final String id;
  final String name;
  final DateTime date;
  final double amount;
  final Catagory catagory;

  String get getDate {
    return formater.format(date);
  }
}

class ExpenseBucket {
  ExpenseBucket({required this.catagory, required this.expenses});
  final Catagory catagory;
  final List<Expense> expenses;

  ExpenseBucket.forCatagory(List<Expense> expense, this.catagory)
      : expenses =
            expense.where((expense) => expense.catagory == catagory).toList();

  double get totalExpenses {
    double sum = 0;
    for (final expense in expenses) {
      sum = sum + expense.amount;
    }
    return sum;
  }
}
