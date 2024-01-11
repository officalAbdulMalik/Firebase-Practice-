import 'package:flutter/material.dart';

class TextEditingConto {
  static var classno = TextEditingController();
  static var Name = TextEditingController();
  static var id = TextEditingController();
  static var Adrees = TextEditingController();

  static var name = TextEditingController();
  static var pass = TextEditingController();
  static var email = TextEditingController();

  static vailadation<bool>() {
    if (classno.text.isEmpty &&
        Name.text.isEmpty &&
        id.text.isEmpty &&
        Adrees.text.isEmpty) {
      return false;
    } else {
      return true;
    }
  }
}
