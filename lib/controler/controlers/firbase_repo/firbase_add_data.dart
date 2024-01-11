import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../text_editing_controler.dart';

class FirbaseAddData {
  static Future<bool> addData() async {
    try {
      FirebaseFirestore user = FirebaseFirestore.instance;
      // user.collection('university').add({
      //   // 'name': TextEditingConto.Name.text.trim(),
      //   // 'address': TextEditingConto.id.text.trim(),
      // });
      return true;
    } on FirebaseException catch (e) {
      print(e.code);
      return false;
    }
  }

  static Future<bool> multipleCollection({required String docid}) async {
    try {
      FirebaseFirestore user = FirebaseFirestore.instance;
      final id = await user
          .collection('university')
          .doc(docid.toString())
          .collection('details')
          .doc()
          .id;
      user
          .collection('university')
          .doc(docid.toString())
          .collection('details')
          .doc(id)
          .set({
        'id': id,
        'University_name': TextEditingConto.id.text.trim(),
        'Address': TextEditingConto.Adrees.text.trim(),
        'classes': TextEditingConto.classno.text.trim(),
      });
      return true;
    } catch (e) {
      if (e is FirebaseException) {
        Fluttertoast.showToast(msg: e.message.toString());
      } else if (e is SocketException) {
        Fluttertoast.showToast(msg: e.message.toString());
      } else {}
      return false;
    }
  }
}
