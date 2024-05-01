import 'package:flutter/material.dart';
import 'package:mela_tracker/models/expense.dart';
import 'package:mela_tracker/widgets/expense_list/expense_list.dart';
import 'package:mela_tracker/widgets/new_expense.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExpenses = [
    Expense(
      title: 'Burger',
      amount: 355.00,
      category: Category.food,
      date: DateTime.now(),
    ),
    Expense(
      title: 'saddle',
      amount: 500.00,
      category: Category.bike,
      date: DateTime.now(),
    ),
    Expense(
      title: 'pack',
      amount: 100.00,
      category: Category.drug,
      date: DateTime.now(),
    ),
    Expense(
      title: 'shoe',
      amount: 4500.00,
      category: Category.leisure,
      date: DateTime.now(),
    ),
  ];
  void _openAddExpenseOverlay() {
    showModalBottomSheet(
      context: context,
      builder: (ctx) => const NewExpense(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mela tracker'),
        actions: [
          IconButton(
            onPressed: _openAddExpenseOverlay,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: Column(
        children: [
          const Text('chart'),
          Expanded(child: ExpenseList(expenses: _registeredExpenses))
        ],
      ),
    );
  }
}
