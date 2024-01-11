import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';

class FirbaseUpdate {
  static Future<bool> updateData(
      {required String docid, required String colloid}) async {
    try {
      FirebaseFirestore firestore = FirebaseFirestore.instance;
      firestore
          .collection('university')
          .doc(colloid)
          .collection('details')
          .doc(docid)
          .update({
        'Address': 'wing',
        'University_name': '2',
        'classes': 'ring',
        'id': docid,
      }).whenComplete(() => true);
      return true;
    } catch (e) {
      print(e.toString());
      Fluttertoast.showToast(msg: '$e');
      return false;
    }
  }
}
