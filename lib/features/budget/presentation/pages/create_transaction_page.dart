import 'package:auto_route/auto_route.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

@RoutePage()
class CreateTransactionPage extends StatefulWidget {
  const CreateTransactionPage({super.key});

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
              decoration: const InputDecoration(border: InputBorder.none),
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
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}
