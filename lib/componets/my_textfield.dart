import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final TextEditingController controller1;
  final String hintText;
  final bool obscureText;
  final FormFieldValidator<String>? validator;

  const MyTextField({
    required this.controller1,
    required this.hintText,
    required this.obscureText,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30.0, right: 30.0, bottom: 20.0),
      child: TextField(
        controller: controller1,
        obscureText: obscureText,
        decoration: InputDecoration(
          fillColor: Colors.white30,
          filled: true,
          hintText: hintText,
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.black,
            ),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.black38,
            ),
          ),
        ),
      ),
    );
  }
}
