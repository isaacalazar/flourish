import 'dart:ui';

import 'package:auto_route/auto_route.dart';
import 'package:flourish/core/routes/app_router.dart';
import 'package:flourish/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:flourish/features/auth/presentation/widgets/onboard_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

@RoutePage()
class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController emailEditingController = TextEditingController();
  final TextEditingController passwordEditingController =
      TextEditingController();
  final TextEditingController usernameEditingController =
      TextEditingController();

  final formKey = GlobalKey<FormState>();

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
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.only(left: 25, right: 25),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Gap(35),
              RichText(
                text: TextSpan(
                  text: "Create an",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                  children: [
                    TextSpan(
                      text: " account!",
                      style: TextStyle(
                        color: Color.fromRGBO(20, 193, 20, 1),
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                      ),
                    )
                  ],
                ),
              ),
              const Gap(35),
              const Padding(
                padding: EdgeInsets.only(left: 4, bottom: 10),
                child: Align(
                  child: Text(
                    "Username",
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                  alignment: Alignment.centerLeft,
                ),
              ),
              OnBoardTextField(
                textEditingController: usernameEditingController,
                fieldName: "Username",
              ),
              const Gap(25),
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
                onPressed: () {
                  context.read<AuthBloc>().add(
                        AuthSignUp(
                          email: emailEditingController.text.trim(),
                          name: usernameEditingController.text.trim(),
                          password: passwordEditingController.text.trim(),
                        ),
                      );
                },
                child: const Text(
                  "Create account!",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
                style: TextButton.styleFrom(
                  backgroundColor: const Color.fromRGBO(41, 194, 69, 0.895),
                  minimumSize: const Size(double.infinity, 60),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
              const Gap(20),
            ],
          ),
        ),
      ),
    );
  }
}
