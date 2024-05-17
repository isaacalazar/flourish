import 'package:auto_route/auto_route.dart';
import 'package:flourish/features/auth/presentation/widgets/onboard_text_field.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

@RoutePage()
class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController emailEditingController = TextEditingController();
  final TextEditingController passwordEditingController =
      TextEditingController();
  final TextEditingController usernameEditingController =
      TextEditingController();

  @override
  void dispose() {
    emailEditingController.dispose();
    passwordEditingController.dispose();
    usernameEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 25, right: 25),
        child: Column(
          children: [
            const Gap(50),
            const Text(
              "Let's create your",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
            const Text(
              "account!",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
                color: Color.fromRGBO(20, 193, 20, 1),
              ),
            ),
            const Gap(35),
            const Padding(
              padding: EdgeInsets.only(left: 4, bottom: 10),
              child: Align(
                child: Text(
                  "Email",
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
                alignment: Alignment.centerLeft,
              ),
            ),
            OnBoardTextField(
              textEditingController: emailEditingController,
              fieldName: "Email",
            ),
            const Gap(25),
            const Padding(
              padding: EdgeInsets.only(left: 4, bottom: 10),
              child: Align(
                child: Text(
                  "Password",
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
                alignment: Alignment.centerLeft,
              ),
            ),
            OnBoardTextField(
              textEditingController: passwordEditingController,
              fieldName: "Password",
            ),
            const Gap(30),
            TextButton(
              onPressed: () {},
              child: const Text("Test"),
              style: TextButton.styleFrom(
                backgroundColor: const Color.fromRGBO(41, 194, 69, 0.895),
                minimumSize: const Size(double.infinity, 50),
                side: const BorderSide(color: Colors.blue),
              ),
            )
          ],
        ),
      ),
    );
  }
}
