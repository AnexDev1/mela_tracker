import 'package:flutter/material.dart';
import 'package:mela_tracker/models/expense.dart';

class ExpenseList extends StatelessWidget {
  const ExpenseList({required this.expenses, super.key});
  final List<Expense> expenses;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (ctx, index) => Text(expenses[index].title),
    );
  }
}
