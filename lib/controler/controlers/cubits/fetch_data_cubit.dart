import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommarce_project/models/data_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:meta/meta.dart';

import '../text_editing_controler.dart';

part 'fetch_data_state.dart';

class FetchDataCubit extends Cubit<FetchDataState> {
  FetchDataCubit() : super(FetchDataInitial());

  fetchData({required String id}) async {
    emit(FetchLoading());
    final List<DataModel> listdata = [];
    try {
      FirebaseFirestore data = FirebaseFirestore.instance;
      data
          .collection('university')
          .doc(id)
          .collection('details')
          .snapshots()
          .listen((event) {
        // listdata.clear();
        for (QueryDocumentSnapshot querysnapshot in event.docs) {
          listdata.add(dataModelFromJson(jsonEncode(querysnapshot.data())));
        }
        emit(FetchLoaded(model: listdata));
      });
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString());
      emit(FetchDataErro());
    }
  }
}
