import 'dart:io';

import 'package:flutter/material.dart';

class BudgetFieldText extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  const BudgetFieldText(
      {super.key, required this.controller, required this.hintText});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        prefixIconColor: const Color.fromRGBO(20, 193, 20, 1),
        border: InputBorder.none,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: Color.fromRGBO(20, 193, 20, 1),
            width: 1.2,
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: Color.fromRGBO(20, 193, 20, 1),
            width: 1.2,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: Color.fromRGBO(20, 193, 20, 1),
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
