import 'package:flourish/core/entities/transaction.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';

class TransactionCard extends StatelessWidget {
  final Transaction transaction;

  const TransactionCard({super.key, required this.transaction});

  @override
  Widget build(BuildContext context) {
    print(transaction.type);
    return Container(
      height: 70,
      padding: const EdgeInsets.only(top: 10, bottom: 10, right: 25),
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Gap(10),
          CircleAvatar(
            backgroundColor: Color.fromRGBO(240, 240, 240, .35),
            child: Icon(
              transaction.type == "Withdrawl"
                  ? Icons.trending_down
                  : Icons.trending_up,
              color: transaction.type == "Withdrawl"
                  ? Color.fromRGBO(240, 0, 0, .8)
                  : Color.fromRGBO(75, 247, 1, 1),
            ),
          ),
          const Gap(10),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(transaction.type == "Withdrawl" ? "Withdrawl" : "Deposit"),
              const Gap(3),
              Text(
                DateFormat('hh:mm a, MMM dd, yyyy')
                    .format(transaction.createdAt)
                    .toString(),
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
                  color: transaction.type == "Withdrawl"
                      ? Color.fromRGBO(237, 54, 34, .3)
                      : Color.fromRGBO(52, 237, 34, .2),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Center(
                  child: Text(
                    transaction.type == "Withdrawl"
                        ? "-${transaction.amount.toStringAsFixed(2)}"
                        : "+${transaction.amount.toStringAsFixed(2)}",
                    style: TextStyle(
                      color: transaction.type == "Withdrawl"
                          ? Color.fromRGBO(240, 0, 0, 1)
                          : Color.fromRGBO(0, 240, 0, 1),
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
