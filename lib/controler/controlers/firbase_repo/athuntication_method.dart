import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class Athunticaton {
  static final FirebaseAuth auth = FirebaseAuth.instance;

  static Future<String?> signUP(
      {required String emial, required String pass}) async {
    try {
      await auth.createUserWithEmailAndPassword(email: emial, password: pass);
      return 'Success';
    } catch (e) {
      if (e is SocketException) {
        return e.message;
      } else if (e is FirebaseException) {
        return e.message;
      } else {
        return 'some other Error';
      }
    }
  }
}
