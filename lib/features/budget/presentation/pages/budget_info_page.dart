import 'package:auto_route/auto_route.dart';
import 'package:flourish/core/entities/budget.dart';
import 'package:flourish/core/entities/transaction.dart';
import 'package:flourish/core/routes/app_router.dart';
import 'package:flourish/features/budget/data/models/transaction_model.dart';
import 'package:flourish/features/budget/presentation/widgets/transaction_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: TextButton(
              onPressed: () {
                AutoRouter.of(context).push(CreateTransactionRoute());
              },
              style: TextButton.styleFrom(
                backgroundColor: Color.fromRGBO(108, 35, 217, 1),
                elevation: 3,
                minimumSize: Size(25, 25),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  side: BorderSide.none,
                ),
              ),
              child: Icon(
                Icons.edit,
                color: Colors.white,
              ),
            ),
          ),
        ],
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
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              children: [],
            ),
          )
        ],
      ),
    );
  }
}
