import 'package:flutter/material.dart';
import 'package:mela_tracker/models/expense.dart';
import 'package:mela_tracker/widgets/expense_list/expense_Item.dart';

class ExpenseList extends StatelessWidget {
  const ExpenseList({required this.expenses, super.key});
  final List<Expense> expenses;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (ctx, index) => ExpenseItem(expenses[index]),
    );
  }
}
