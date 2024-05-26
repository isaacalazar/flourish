import 'package:auto_route/auto_route.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flourish/core/entities/budget.dart';
import 'package:flourish/features/budget/presentation/bloc/budget_bloc.dart';

import 'package:flourish/features/transaction/presentation/bloc/transaction_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

@RoutePage()
class CreateTransactionPage extends StatefulWidget {
  final Budget budget;
  const CreateTransactionPage({super.key, required this.budget});

  @override
  State<CreateTransactionPage> createState() => _CreateTransactionPageState();
}

class _CreateTransactionPageState extends State<CreateTransactionPage> {
  int currentSelection = 0;

  final TextEditingController amountController = TextEditingController();

  @override
  void dispose() {
    amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Edit Transactions",
          style: TextStyle(fontSize: 25),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          children: [
            const Gap(100),
            Container(
              width: double.infinity,
              child: CupertinoSlidingSegmentedControl(
                thumbColor: currentSelection == 0
                    ? Colors.greenAccent
                    : Colors.redAccent,
                children: {
                  0: Text("Deposit"),
                  1: Text("Withdrawl"),
                },
                groupValue: currentSelection,
                onValueChanged: (index) {
                  if (index != null && index != currentSelection) {
                    setState(
                      () {
                        currentSelection = index;
                      },
                    );
                  }
                },
              ),
            ),
            const Gap(50),
            TextField(
              controller: amountController,
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: InputBorder.none,
                prefix: Text(
                  "\$",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: currentSelection == 0
                        ? Colors.greenAccent
                        : Colors.redAccent,
                  ),
                ),
              ),
              style: TextStyle(
                fontSize: 65,
                color: currentSelection == 0
                    ? Colors.greenAccent
                    : Colors.redAccent,
              ),
              cursorColor: Colors.black,
            ),
            const Gap(5),
            DottedLine(
              direction: Axis.horizontal,
              dashLength: 5,
            ),
            const Gap(20),
            TextButton(
              child: Text(
                currentSelection == 0 ? "Deposit" : "Withdraw",
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
              style: TextButton.styleFrom(
                backgroundColor: currentSelection == 0
                    ? Colors.greenAccent
                    : Colors.redAccent,
                minimumSize: Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () {
                final int selectedAmount =
                    int.parse(amountController.text.trim());
                final bool isDeposit = currentSelection == 0 ? true : false;

                print(selectedAmount + widget.budget.budgetAmount);
                print(widget.budget.budgetAmount - selectedAmount);
                print(isDeposit);
                if (isDeposit &&
                    selectedAmount + widget.budget.budgetAmount <
                        widget.budget.budgetMaxAmount) {
                  context.read<TransactionBloc>().add(TransactionUpload(
                      budgetId: widget.budget.budgetId,
                      amount: selectedAmount,
                      type: "Deposit"));
                  context.read<BudgetBloc>().add(BudgetUpdate(
                      widget.budget.budgetId,
                      widget.budget.budgetAmount + selectedAmount));
                } else if (isDeposit == false &&
                    widget.budget.budgetAmount - selectedAmount > 0) {
                  context.read<TransactionBloc>().add(TransactionUpload(
                      budgetId: widget.budget.budgetId,
                      amount: selectedAmount,
                      type: "Withdrawl"));

                  context.read<BudgetBloc>().add(BudgetUpdate(
                      widget.budget.budgetId,
                      widget.budget.budgetAmount - selectedAmount));
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
