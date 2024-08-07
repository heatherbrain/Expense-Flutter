import 'package:flutter/material.dart';
import 'package:flutter_second/widgets/expenses_list/expenses_list.dart';
import 'package:flutter_second/models/expense_data.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() {
    return _ExpenseState();
  }
}

class _ExpenseState extends State<Expenses> {
  final List<ExpenseData> _registeredExpenses = [
    ExpenseData(
      title: 'Genshin Food',
      amount: 19.99,
      date: DateTime.now(),
      category: Category.food,
    ),
    ExpenseData(
      title: 'Genshin Item',
      amount: 11.99,
      date: DateTime.now(),
      category: Category.item,
    ),
    ExpenseData(
      title: 'Genshin Weapon',
      amount: 24.99,
      date: DateTime.now(),
      category: Category.weapon,
    ),
  ];

  void _openAddExpenseOverlay() {
    showModalBottomSheet(
      context: context,
      builder: (ctx) => Text('Modal bottom sheet'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Expense Tracker'),
        actions: [
          IconButton(
              onPressed: _openAddExpenseOverlay, icon: const Icon(Icons.add)),
        ],
      ),
      body: Column(
        children: [
          const Text('Chart'),
          Expanded(
            child: ExpensesList(expenses: _registeredExpenses),
          ),
        ],
      ),
    );
  }
}
