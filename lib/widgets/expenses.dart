import 'package:flutter/material.dart';
import 'package:flutter_second/widgets/expenses_list/expenses_list.dart';
import 'package:flutter_second/models/expense_data.dart';
import 'package:flutter_second/widgets/new_expense.dart';

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
      isScrollControlled: true,
      context: context,
      builder: (ctx) => NewExpense(onAddExpense: _addExpense),
    );
  }

  void _addExpense(ExpenseData expense) {
    setState(() {
      _registeredExpenses.add(expense);
    });
  }

  void _removedExpense(ExpenseData expense) {
    final expenseIndex = _registeredExpenses.indexOf(expense);
    setState(() {
      _registeredExpenses.remove(expense);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: Duration(seconds: 3),
        content: Text('Expense deleted.'),
        action: SnackBarAction(label: 'Undo', onPressed: () {
          setState(() {
            _registeredExpenses.insert(expenseIndex, expense);
          });
        }),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget mainContent = Center(
      child: Text('No Expenses Found.'),
    );

    if (_registeredExpenses.isNotEmpty) {
      mainContent = ExpensesList(
          expenses: _registeredExpenses, onRemoveExpense: _removedExpense);
    }

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
            child: mainContent,
          ),
        ],
      ),
    );
  }
}
