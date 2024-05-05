import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

const uuid = Uuid();

final formatter = DateFormat.yMd();

enum Category { food, travel, bike, drug, leisure }

final categoryIcons = {
  Category.bike: Icons.pedal_bike,
  Category.drug: Icons.medication,
  Category.food: Icons.food_bank,
  Category.travel: Icons.flight,
  Category.leisure: Icons.money
};

class Expense {
  Expense(
      {required this.category,
      required this.title,
      required this.amount,
      required this.date})
      : id = uuid.v4();
  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;

  String get formattedDate {
    final today = DateTime.now();
    final yesterday = today.subtract(const Duration(days: 1));

    if (date.day == today.day) {
      return "Today";
    } else if (date.day == yesterday.day) {
      return "Yesterday";
    } else {
      return formatter.format(date); // Use default formatting for other dates
    }
  }
}

class ExpenseBucket {
  ExpenseBucket({required this.category, required this.expenses});

  ExpenseBucket.forCategory(List<Expense> allExpenses, this.category)
      : expenses = allExpenses
            .where((expense) => expense.category == category)
            .toList();
  final Category category;
  final List<Expense> expenses;

  double get totalExpenses {
    double sum = 0;
    for (final expense in expenses) {
      sum += expense.amount;
    }
    return sum;
  }
}
