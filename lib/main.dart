import 'package:expense_tracker/code2.dart';
import 'package:expense_tracker/expense.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

var kcolor = ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 56, 202, 144));
var kDarkColorTheme = ColorScheme.fromSeed(
    seedColor: Color.fromARGB(255, 5, 99, 125), brightness: Brightness.dark);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expense Tracker',
      darkTheme: ThemeData.dark().copyWith(colorScheme: kDarkColorTheme),
      theme: ThemeData().copyWith(
          colorScheme: kcolor,
          appBarTheme: AppBarTheme(
            backgroundColor: Colors.red,
          ),
          cardTheme: const CardTheme().copyWith(
            color: Colors.red,
          )),
      themeMode: ThemeMode.system,
      home: const MyApp1(),
    );
  }
}
