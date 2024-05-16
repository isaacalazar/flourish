import 'package:auto_route/auto_route.dart';
import 'package:flourish/features/budget/presentation/widgets/budget_card.dart';
import 'package:flourish/features/budget/presentation/widgets/primary_budget_card.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.menu),
          iconSize: 28,
        ),
        title: const Align(
          alignment: Alignment.topLeft,
          child: Text(
            "Hello, User",
            style: TextStyle(
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
          const PrimaryBudgetCard(),
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
