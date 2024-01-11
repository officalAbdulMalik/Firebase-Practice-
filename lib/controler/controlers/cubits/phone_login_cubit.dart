import 'package:bloc/bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:meta/meta.dart';

import '../firbase_repo/phone_athunti.dart';

part 'phone_login_state.dart';

class PhoneLoginCubit extends Cubit<PhoneLoginState> {
  PhoneLoginCubit() : super(PhoneLoginInitial());
  Future phoneLogin() async {
    try {
      emit(PhoneLoginLoading());
      final login = PhoneNumber.phoneLogin();
      if (login != null) {
        emit(PhoneLoginLoaded());
      } else {
        emit(PhoneLoginError());
      }
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString());
    }
  }
}
