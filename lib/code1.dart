import 'package:flutter/material.dart';

void main() {
  runApp(const CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  const CalculatorApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: const Text('Calculator'),
          backgroundColor: Colors.black,
        ),
        body: Column(
          children: [
            // Display Section
            Expanded(
              child: Container(
                color: Colors.black,
                alignment: Alignment.bottomRight,
                padding: const EdgeInsets.all(20),
                child: const Text(
                  '0',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 60,
                  ),
                ),
              ),
            ),
            // Button Section
            Expanded(
              flex: 2,
              child: Container(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    _buildButtonRow(['7', '8', '9', '/']),
                    _buildButtonRow(['4', '5', '6', 'x']),
                    _buildButtonRow(['1', '2', '3', '-']),
                    _buildButtonRow(['0', '.', '=', '+']),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildButtonRow(List<String> buttons) {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: buttons.map((button) {
          return _buildButton(button);
        }).toList(),
      ),
    );
  }

  Widget _buildButton(String text) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.all(20),
            backgroundColor: Colors.grey[850],
          ),
          child: Text(
            text,
            style: const TextStyle(fontSize: 30, color: Colors.white),
          ),
        ),
      ),
    );
  }
}