import 'package:flutter/material.dart';
import 'package:mela_tracker/models/expense.dart';
import 'package:mela_tracker/widgets/expense_list/expense_Item.dart';

class ExpenseList extends StatelessWidget {
  const ExpenseList(
      {required this.expenses, required this.onRemove, super.key});
  final List<Expense> expenses;
  final void Function(Expense expense) onRemove;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: expenses.length,
        itemBuilder: (ctx, index) => Dismissible(
              key: ValueKey(expenses[index]),
              background: Container(
                color: Theme.of(context).colorScheme.error.withOpacity(.75),
                margin: EdgeInsets.symmetric(
                    horizontal: Theme.of(context).cardTheme.margin!.horizontal),
              ),
              onDismissed: (direction) {
                onRemove(expenses[index]);
              },
              child: ExpenseItem(
                expenses[index],
              ),
            ));
  }
}
