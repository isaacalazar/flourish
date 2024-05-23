import 'dart:io';

import 'package:flutter/material.dart';

class BudgetFieldText extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool? isInteger;
  const BudgetFieldText({
    super.key,
    required this.controller,
    required this.hintText,
    this.isInteger,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      //add keyboard type number
      decoration: InputDecoration(
        hintText: hintText,
        prefixIconColor: const Color.fromRGBO(20, 193, 20, 1),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
        border: InputBorder.none,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: Color.fromRGBO(108, 35, 217, 1),
            width: 1.5,
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: Color.fromRGBO(108, 35, 217, 1),
            width: 1.2,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: Color.fromRGBO(108, 35, 217, 1),
            width: 1.2,
          ),
        ),
        fillColor: const Color.fromRGBO(20, 193, 20, .1),
      ),
      validator: (value) {
        if (controller.text.isEmpty) {
          return "Needs to be filled";
        }
        return null;
      },
    );
  }
}
