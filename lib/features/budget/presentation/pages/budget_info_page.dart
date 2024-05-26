import 'package:auto_route/auto_route.dart';
import 'package:flourish/core/entities/budget.dart';
import 'package:flourish/core/routes/app_router.dart';
import 'package:flourish/features/budget/presentation/widgets/transaction_card.dart';
import 'package:flourish/features/transaction/presentation/bloc/transaction_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

@RoutePage()
class BudgetInfoPage extends StatefulWidget {
  final Budget budget;
  const BudgetInfoPage({super.key, required this.budget});

  @override
  State<BudgetInfoPage> createState() => _BudgetInfoPageState();
}

class _BudgetInfoPageState extends State<BudgetInfoPage> {
  @override
  void initState() {
    context
        .read<TransactionBloc>()
        .add(TransactionFetch(budgetId: widget.budget.budgetId));
    super.initState();
  }

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
                AutoRouter.of(context)
                    .push(CreateTransactionRoute(budget: widget.budget));
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
          const Gap(10),
          Expanded(
            child: BlocBuilder<TransactionBloc, TransactionState>(
              builder: (context, state) {
                if (state is TransactionLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (state is TransactionFetchSuccess &&
                    state.transactions.isNotEmpty) {
                  return ListView.builder(
                    itemCount: state.transactions.length,
                    itemBuilder: (context, index) {
                      return TransactionCard(
                        transaction: state.transactions[index],
                      );
                    },
                  );
                }
                if (state is TransactionFetchSuccess &&
                    state.transactions.isEmpty) {
                  return const Center(
                    child: Text("No transactions found."),
                  );
                }
                if (state is TransactionFailure) {
                  return Center(
                    child: Text("Failed to load transactions."),
                  );
                }

                return SizedBox();
              },
            ),
          ),
        ],
      ),
    );
  }
}
