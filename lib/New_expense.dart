import 'package:expense_tracker/models/Expense.dart';
import 'package:flutter/material.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key, required this.onAddExpense});

  final void Function(Expense expense) onAddExpense;
  @override
  State<NewExpense> createState() {
    return _NewExpense();
  }
}

class _NewExpense extends State<NewExpense> {
  final _titlecontroller = TextEditingController();
  final _amountcontroller = TextEditingController();
  DateTime? _date;
  Catagory? _selectedcatagory = Catagory.leisure;

  @override
  void dispose() {
    _titlecontroller.dispose();
    _amountcontroller.dispose();
    super.dispose();
  }

  void ondate() async {
    final now = DateTime.now();
    final selecteddate = await showDatePicker(
        context: context,
        firstDate: DateTime(now.year - 1, now.month, now.day),
        lastDate: now);

    setState(() {
      _date = selecteddate;
    });
  }

  void _Validate() {
    final enteredAmount = double.tryParse(_amountcontroller.text);
    final amountIsValid = enteredAmount == null || enteredAmount <= 0;
    if (_titlecontroller.text.isEmpty || amountIsValid || _date == null) {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text('invalid input'),
          content:
              const Text('please make sure entered amount/title/date is valid'),
              backgroundColor: const Color.fromARGB(255, 217, 63, 52),
          actions: [
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(ctx);
                },
                child: const Text('Ok'))
          ],
        ),
      );
      return;
    }
    widget.onAddExpense(Expense(amount: enteredAmount, date: _date!, name: _titlecontroller.text, catagory: _selectedcatagory!));
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16,48,16,16),
      child: Column(
        children: [
          TextField(
            controller: _titlecontroller,
            maxLength: 50,
            decoration: const InputDecoration(
              label: Text('Enter title'),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _amountcontroller,
                  maxLength: 8,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    label: Text('Enter amount'),
                  ),
                ),
              ),
              const SizedBox(
                width: 16,
              ),
              Row(
                children: [
                  Text((_date == null) ? 'selected date' : _date.toString()),
                  IconButton(
                      onPressed: ondate, icon: const Icon(Icons.calendar_month))
                ],
              )
            ],
          ),
          const SizedBox(
            height: 25,
          ),
          Row(
            children: [
              DropdownButton(
                value: _selectedcatagory,
                items: Catagory.values
                    .map(
                      (Catagory) => DropdownMenuItem(
                        value: Catagory,
                        child: Text(
                          Catagory.name.toUpperCase(),
                        ),
                      ),
                    )
                    .toList(),
                onChanged: (value) {
                  if (value == null) return;
                  setState(() {
                    _selectedcatagory = value;
                  });
                },
              ),
              const SizedBox(
                width: 14,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Cancel'),
              ),
              const SizedBox(
                width: 9,
              ),
              ElevatedButton(
                onPressed: _Validate,
                child: const Text('Save Expense'),
              ),
            ],
          )
        ],
      ),
    );
  }
}
