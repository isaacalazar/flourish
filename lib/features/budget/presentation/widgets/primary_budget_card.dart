import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class PrimaryBudgetCard extends StatelessWidget {
  const PrimaryBudgetCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color.fromRGBO(10, 10, 10, 1),
      ),
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("You've spent"),
              Text("Left in budget"),
            ],
          ),
          const Gap(5),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "\$500",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              Text(
                "\$1000",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ],
          ),
          const Gap(15),
          LinearProgressIndicator(
            borderRadius: BorderRadius.circular(5),
            color: const Color.fromRGBO(108, 35, 217, 1),
            minHeight: 10,
            value: .5,
          ),
          const Gap(10),
          const Text(
            "8 days left this month.",
            style: TextStyle(
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
