import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

final formatter = DateFormat.yMd();

const uuid = Uuid();

enum Category { food, travel, leisure, work }

const categoryIcons = {
  Category.food: Icons.lunch_dining,
  Category.travel: Icons.travel_explore,
  Category.leisure: Icons.movie,
  Category.work: Icons.work,
};

class Expense {
  final String title;
  final double amount;
  final String id;
  final DateTime date;
  final Category category;

  Expense({
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
  }) : id = uuid.v4();

  String get formattedDate {
    return formatter.format(date);
  }
}

class ExpenseBucket {
  const ExpenseBucket({required this.category, required this.expenses});

  ExpenseBucket.forCategory(List<Expense> allExpense, this.category)
    : expenses = allExpense
          .where((expense) => expense.category == category)
          .toList();

  final Category category;
  final List<Expense> expenses;

  double get totalExpenses {
    double sum = 0;
    // for (var i = 0; i < expenses.length; i++) return sum; cara lama
    //todo : cara baru menggunakan Loop Fo-in
    for (final expense in expenses) {
      sum += expense.amount; // sama dengan sum = sum +exspense.amount;
    }
    return sum;
  }
}
