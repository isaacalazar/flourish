import 'package:auto_route/auto_route.dart';
import 'package:flourish/core/routes/app_router.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

@RoutePage()
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          const Gap(25),
          RichText(
            text: TextSpan(
              text: "It's time to",
              style: TextStyle(
                color: Colors.black,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
              children: [
                TextSpan(
                  text: " Flourish",
                  style: TextStyle(
                    color: Color.fromRGBO(20, 193, 20, 1),
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          const Gap(10),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: const Text(
              "Your one stop shop for personal budgeting..",
              style: TextStyle(
                color: Color.fromRGBO(0, 0, 0, 1),
                fontSize: 20,
                fontWeight: FontWeight.w300,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const Gap(50),
          Image.asset(
            'assets/images/onboard_image.png',
            fit: BoxFit.cover,
            height: 200,
            width: double.infinity,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => AutoRouter.of(context).push(const HomeRoute()),
        backgroundColor: Colors.transparent,
        elevation: 0, // Remove default elevation
        child: Container(
          width: 56.0,
          height: 56.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Color.fromRGBO(20, 193, 20, 1),
            boxShadow: [
              BoxShadow(
                color: Color.fromRGBO(20, 193, 20, 1),
                blurRadius: 5,
                spreadRadius: .4,
              ),
            ],
          ),
          child: Icon(
            Icons.send,
            color: Colors.white,
            size: 35,
          ),
        ),
      ),
    );
  }
}
