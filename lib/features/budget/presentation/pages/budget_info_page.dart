import 'package:auto_route/auto_route.dart';
import 'package:flourish/core/entities/budget.dart';
import 'package:flourish/core/entities/transaction.dart';
import 'package:flourish/features/budget/data/models/transaction_model.dart';
import 'package:flourish/features/budget/presentation/widgets/transaction_card.dart';
import 'package:flutter/material.dart';

@RoutePage()
class BudgetInfoPage extends StatelessWidget {
  final Budget budget;
  const BudgetInfoPage({super.key, required this.budget});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Transactions",
          style: TextStyle(fontSize: 25),
        ),
      ),
      body: Column(
        children: [
          Container(
            constraints: BoxConstraints(
              minHeight: 250,
            ),
            margin:
                const EdgeInsets.only(top: 10, bottom: 10, right: 20, left: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: [Text("Test")],
            ),
          )
        ],
      ),
    );
  }
}
