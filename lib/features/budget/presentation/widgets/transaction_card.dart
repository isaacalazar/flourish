import 'package:flourish/core/entities/transaction.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class TransactionCard extends StatelessWidget {
  final Transaction transaction;

  const TransactionCard({super.key, required this.transaction});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      padding: const EdgeInsets.only(top: 10, bottom: 10, right: 25),
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Row(
        children: [
          const Gap(10),
          CircleAvatar(
            backgroundColor: Color.fromRGBO(240, 240, 240, .35),
            child: Icon(
              Icons.trending_down,
              color: Color.fromRGBO(240, 0, 0, .8),
            ),
          ),
          const Gap(10),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Withdrawl"),
              const Gap(3),
              Text(
                "May 24, 2024",
                style: TextStyle(
                  fontWeight: FontWeight.w300,
                  color: Color.fromRGBO(0, 0, 0, .5),
                ),
              ),
            ],
          ),
          Spacer(),
          Wrap(
            children: [
              Container(
                constraints: BoxConstraints(
                  minHeight: 30,
                  minWidth: 60,
                ),
                decoration: BoxDecoration(
                  color: Color.fromRGBO(237, 54, 34, .3),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Center(
                  child: Text(
                    "-\$100",
                    style: TextStyle(
                      color: Color.fromRGBO(240, 0, 0, 1),
                      overflow: TextOverflow.visible,
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
