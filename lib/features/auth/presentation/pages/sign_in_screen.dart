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
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.only(left: 25, right: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Gap(35),
              const Text(
                "Welcome back to your",
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
              BlocConsumer<AuthBloc, AuthState>(
                listener: (context, state) {
                  if (state is AuthSuccess) {
                    AutoRouter.of(context).push(const HomeRoute());
                  }
                },
                builder: (context, state) {
                  if (state is AuthLoading) {
                    return Center(child: const CircularProgressIndicator());
                  }
                  return TextButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        context.read<AuthBloc>().add(
                              AuthSignIn(
                                email: emailEditingController.text.trim(),
                                password: passwordEditingController.text.trim(),
                              ),
                            );
                      }
                    },
                    child: const Text(
                      "Sign In",
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
                  );
                },
              ),
              const Gap(20),
              Padding(
                padding: const EdgeInsets.only(left: 5.0),
                child: GestureDetector(
                  onTap: () {
                    AutoRouter.of(context).push(SignUpRoute());
                  },
                  child: RichText(
                    text: const TextSpan(
                      text: "Don't have an account? ",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                      ),
                      children: [
                        TextSpan(
                          text: "Sign Up",
                          style: TextStyle(
                            color: Color.fromRGBO(20, 193, 20, 1),
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const Gap(40),
              const Row(
                children: [
                  Flexible(child: Divider()),
                  Gap(10),
                  Text("OR"),
                  Gap(10),
                  Flexible(child: Divider()),
                ],
              ),
              const Gap(40),
              InkWell(
                onTap: () {},
                splashColor: const Color.fromRGBO(41, 194, 69, 0.895),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.green, width: 1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  height: 75,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset("assets/images/google.png", height: 45),
                      const Gap(10),
                      const Text(
                        "Sign in with google",
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
