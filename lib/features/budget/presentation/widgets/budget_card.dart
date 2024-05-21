import 'package:flourish/core/entities/budget.dart';
import 'package:flutter/material.dart';

class BudgetCard extends StatelessWidget {
  final Budget budget;
  const BudgetCard({super.key, required this.budget});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      color: Colors.transparent,
      height: 200,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Stack(
          children: [
            Image.network(
              "https://i0.wp.com/theluxurytravelexpert.com/wp-content/uploads/2014/07/santorini-greece-8-1.jpg?resize=678%2C382&ssl=1",
              //  budget.imageUrl,
              fit: BoxFit.cover,
              width: double.infinity,
              height: 200,
            ),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.transparent,
                    Colors.black.withOpacity(0.7),
                  ],
                  begin: Alignment.center,
                  end: Alignment.bottomCenter,
                ),
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    budget.budgetName,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 5, left: 10),
                        child: Text(
                          "${(budget.budgetMaxAmount / budget.budgetAmount).toDouble() * 100}%",
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: RichText(
                            text: TextSpan(
                              text: "\$ ${budget.budgetMaxAmount}",
                              style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                              ),
                              children: [
                                TextSpan(
                                  text: "\n / ${budget.budgetAmount}",
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  LinearProgressIndicator(
                    value: ((budget.budgetAmount / budget.budgetMaxAmount) /
                        budget.budgetAmount),
                    color: const Color.fromRGBO(108, 35, 217, 1),
                    borderRadius: BorderRadius.circular(10),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
