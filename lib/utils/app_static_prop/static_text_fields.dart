import 'package:flutter/material.dart';

class CustomTextFields extends StatelessWidget {
  String hint;
  TextEditingController controler;

  CustomTextFields(this.hint, this.controler, {super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controler,
      decoration: InputDecoration(
        hintText: hint,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return 'Fill Form Correctly';
        } else {
          return null;
        }
      },
    );
  }
}
