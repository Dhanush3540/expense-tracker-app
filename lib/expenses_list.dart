import 'package:expense_app/expense1.dart';
import 'package:flutter/material.dart';
import 'package:expense_app/expenses_item.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({
    super.key,
    required this.expenses,
    required this.onRemoveExpenses,
  });

  final List<Expense1> expenses;
  final void Function(Expense1 expense) onRemoveExpenses;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (context, index) => Dismissible(
        key: ValueKey(expenses[index]),
        background: Container(
          color: Theme.of(context).colorScheme.error,
          margin: EdgeInsets.symmetric(
            horizontal: Theme.of(context).cardTheme.margin!.horizontal,
          ),
        ),
        onDismissed: (direction) => onRemoveExpenses(expenses[index]),
        child: ExpensesItem(expenses[index]),
      ),
    );
  }
}
