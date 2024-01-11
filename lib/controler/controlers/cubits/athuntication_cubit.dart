import 'package:bloc/bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:meta/meta.dart';

import '../firbase_repo/athuntication_method.dart';

part 'athuntication_state.dart';

class AthunticationCubit extends Cubit<AthunticationState> {
  AthunticationCubit() : super(AthunticationInitial());

  Future athuntic({required String email, required String pass}) async {
    emit(AthunticationLoading());
    final auth = await Athunticaton.signUP(emial: email, pass: pass);
    if (auth == 'Success') {
      Fluttertoast.showToast(msg: auth.toString());
      emit(AthunticationLoaded());
    } else {
      Fluttertoast.showToast(msg: auth.toString());
      emit(AthunticationError());
    }
  }
}
