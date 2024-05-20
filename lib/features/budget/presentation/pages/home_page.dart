import 'package:auto_route/auto_route.dart';
import 'package:flourish/core/cubit/app_user_cubit.dart';
import 'package:flourish/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:flourish/features/budget/presentation/bloc/budget_bloc.dart';
import 'package:flourish/features/budget/presentation/widgets/budget_card.dart';
import 'package:flourish/features/budget/presentation/widgets/primary_budget_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

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
    // context.read<BudgetBloc>().add(BudgetFetchAllBudgets("Isaac"));
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
          PrimaryBudgetCard(
            currentBudget: userData.globalBalance,
            budgetAmount: userData.allocatedBudget,
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
          Expanded(
            child: ListView.builder(
              itemBuilder: ((context, index) {
                return const BudgetCard();
              }),
              padding: EdgeInsets.zero,
              itemCount: 1,
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
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
