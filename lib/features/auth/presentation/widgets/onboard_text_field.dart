import 'dart:io';

import 'package:flutter/material.dart';

class OnBoardTextField extends StatefulWidget {
  final TextEditingController textEditingController;
  final String fieldName;

  const OnBoardTextField({
    Key? key,
    required this.textEditingController,
    required this.fieldName,
  }) : super(key: key);

  @override
  State<OnBoardTextField> createState() => _OnBoardTextFieldState();
}

class _OnBoardTextFieldState extends State<OnBoardTextField> {
  bool shouldFill = true;

  @override
  Widget build(BuildContext context) {
    return Focus(
      onFocusChange: (value) {
        setState(() {
          shouldFill = !value;
        });
      },
      child: TextFormField(
        onChanged: (text) {},
        controller: widget.textEditingController,
        decoration: InputDecoration(
          prefixIcon: widget.fieldName == "Email"
              ? Icon(Icons.email, color: Color.fromRGBO(20, 193, 20, 1))
              : Icon(Icons.lock, color: Color.fromRGBO(20, 193, 20, 1)),
          hintText: widget.fieldName,
          prefixIconColor: Color.fromRGBO(20, 193, 20, 1),
          border: InputBorder.none,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: Colors.red,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: Color.fromRGBO(20, 193, 20, 1),
              width: 1.2,
            ),
          ),
          filled: shouldFill,
          fillColor: Color.fromRGBO(20, 193, 20, .1),
        ),
        obscureText: widget.fieldName == "Password" ? true : false,
        validator: (value) {
          if (value != null) {}
          return null;
        },
      ),
    );
  }
}
