import 'package:bloc/bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:meta/meta.dart';

import '../firbase_repo/firbase_update_data.dart';

part 'update_state.dart';

class UpdateCubit extends Cubit<UpdateState> {
  UpdateCubit() : super(UpdateInitial());

  Future update({required String docid, required String colleid}) async {
    print('$docid $colleid');
    emit(UpdateLoading());
    print('Update Loading');
    try {
      var data = await FirbaseUpdate.updateData(docid: docid, colloid: colleid);
      if (data == true) {
        emit(UpdateLoaded());
        print('update Loaded');
      } else {
        emit(UpdateError());
      }
    } catch (e) {
      Fluttertoast.showToast(msg: '$e');
    }
  }
}
