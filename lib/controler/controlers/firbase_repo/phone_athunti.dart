import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../views/verfiy_otp.dart';

class PhoneNumber {
  static String verify = '';
  static String smscode = '';
  static FirebaseAuth auth = FirebaseAuth.instance;
  static Future signIn(BuildContext context, String phone) async {
    try {
      auth.verifyPhoneNumber(
          phoneNumber: phone,
          verificationCompleted: (AuthCredential credential) async {
            UserCredential result = await auth.signInWithCredential(credential);
            Navigator.of(context).pop();
            User? user = result.user;
            if (user != null) {
            } else {
              debugPrint('User dosenot Exist');
              Fluttertoast.showToast(msg: 'User dosenot Exist');
            }
          },
          verificationFailed: (FirebaseAuthException e) {
            Fluttertoast.showToast(msg: e.message.toString());
          },
          codeSent: (String verification, int? token) {
            verify = verification;
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return const VerifyOtp();
            }));
          },
          codeAutoRetrievalTimeout: (String verificationId) {});
    } catch (e) {
      print(e.toString());
      if (e is SocketException) {
        Fluttertoast.showToast(msg: e.message);
      } else if (e is FirebaseException) {
        Fluttertoast.showToast(msg: e.message.toString());
      } else {
        Fluttertoast.showToast(msg: e.toString());
      }
    }
  }

  // this method is use for to login your phone number with verifications this method
  //is after than send to your phone the otp code
  static Future phoneLogin() async {
    try {
      AuthCredential credential =
          PhoneAuthProvider.credential(verificationId: verify, smsCode: sms);
      UserCredential result = await auth.signInWithCredential(credential);
      User? user = result.user;
      if (user != null) {
        Fluttertoast.showToast(msg: 'Completed');
      } else {
        Fluttertoast.showToast(msg: 'Error');
      }
    } catch (e) {
      if (e is SocketException) {
        Fluttertoast.showToast(msg: 'Socket Exception ${e.message}');
      } else if (e is FirebaseException) {
        Fluttertoast.showToast(msg: 'Firbase Exception${e.message}');
      } else {
        Fluttertoast.showToast(msg: 'Some Other ${e.toString()}');
      }
    }
  }
}
