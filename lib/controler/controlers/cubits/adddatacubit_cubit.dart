import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:meta/meta.dart';
import '../../../views/details_screen.dart';
import '../firbase_repo/firbase_add_data.dart';

part 'adddatacubit_state.dart';

class AdddatacubitCubit extends Cubit<AdddatacubitState> {
  AdddatacubitCubit() : super(AdddatacubitInitial());

  Future adddata({required String id, required BuildContext context}) async {
    emit(AddDataLoadingState());
    print('Loading emit..........');
    try {
      var data = await FirbaseAddData.multipleCollection(docid: id);
      if (data == true) {
        emit(AddDataLoadedState());
        print('Loadeaded emit..................');
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return DrtailScreen();
        }));
      } else {
        emit(AddDataErrorState());
      }
    } catch (e) {
      Fluttertoast.showToast(msg: '$e');
    }
  }
}
