import 'package:auto_route/auto_route.dart';
import 'package:flourish/core/cubit/app_user_cubit.dart';
import 'package:flourish/core/entities/budget.dart';
import 'package:flourish/core/entities/transaction.dart';
import 'package:flourish/core/routes/app_router.dart';
import 'package:flourish/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:flourish/features/budget/presentation/bloc/budget_bloc.dart';
import 'package:flourish/features/budget/presentation/widgets/budget_card.dart';
import 'package:flourish/features/budget/presentation/widgets/primary_budget_card.dart';
import 'package:flourish/features/transaction/presentation/bloc/transaction_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

@RoutePage()
class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // context.read<BudgetBloc>().add(BudgetFetchAllBudgets());
    context.read<BudgetBloc>().add(BudgetWatch());
    //context.read<TransactionBloc>().add(TransactionFetch(budgetId: "Default"));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final userData =
        (context.read<AppUserCubit>().state as AppUserLoggedIn).user;

    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.menu),
          iconSize: 28,
        ),
        title: Align(
          alignment: Alignment.topLeft,
          child: Text(
            "Hello, ${userData.name}",
            style: const TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        actions: [],
      ),
      body: Column(
        children: [
          const Gap(10),
          BlocConsumer<BudgetBloc, BudgetState>(
            listener: (context, state) {
              // TODO: implement listener
            },
            builder: (context, state) {
              print(state);
              if (state is BudgetDisplaySuccess && state.budgets.isNotEmpty) {
                final budgets = state.budgets;
                int startingAmount = userData.allocatedBudget;
                int collectiveAmount = userData.globalBalance;

                for (Budget budget in budgets) {
                  startingAmount = startingAmount + budget.budgetAmount;
                  collectiveAmount = collectiveAmount + budget.budgetMaxAmount;
                }

                return PrimaryBudgetCard(
                  currentBudget: startingAmount,
                  budgetAmount: collectiveAmount - 100,
                );
              }
              return PrimaryBudgetCard(
                currentBudget: userData.allocatedBudget,
                budgetAmount: userData.globalBalance,
              );
            },
          ),
          const Gap(20),
          const Padding(
            padding: EdgeInsets.only(left: 20),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Goals",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const Gap(20),
          BlocConsumer<BudgetBloc, BudgetState>(
            listener: (context, state) {},
            builder: (context, state) {
              print(state);
              if (state is BudgetLoading) {
                return const Center(child: CircularProgressIndicator());
              }

              if ((state is BudgetDisplaySuccess) && state.budgets.isNotEmpty) {
                final budgets = state.budgets;

                return Expanded(
                  child: ListView.builder(
                    itemBuilder: ((context, index) {
                      final budget = budgets[index];

                      return BudgetCard(
                        budget: budget,
                      );
                    }),
                    padding: EdgeInsets.zero,
                    itemCount: budgets.length,
                  ),
                );
              }
              return SizedBox();
            },
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          AutoRouter.of(context).push(CreateBudgetRoute());
        },
        child: const Icon(
          Icons.draw,
          color: Colors.white,
          size: 30,
        ),
        backgroundColor: const Color.fromRGBO(108, 35, 217, 1),
      ),
    );
  }
}
