import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../firbase_repo/phone_athunti.dart';

part 'verify_state.dart';

class VerifyCubit extends Cubit<VerifyState> {
  VerifyCubit() : super(VerifyInitial());
  Future verify({
    required BuildContext context,
    required String phone,
  }) async {
    emit(VerifyLoading());
    print('loading emit');
    try {
      final verif = PhoneNumber.signIn(context, phone);
      if (verif != null) {
        emit(VerifyLoaded());
      } else {
        emit(VerifyError());
      }
    } catch (e) {
      emit(VerifyError());
      Fluttertoast.showToast(msg: e.toString());
    }
  }
}
