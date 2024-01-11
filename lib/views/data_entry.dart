import 'package:ecommarce_project/controler/controlers/firbase_repo/firbase_add_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../controler/controlers/cubits/adddatacubit_cubit.dart';
import '../controler/controlers/firbase_repo/fetch_data_repo.dart';
import '../controler/controlers/text_editing_controler.dart';
import '../utils/app_static_prop/static_text_fields.dart';
import 'details_screen.dart';

class DataEntry extends StatelessWidget {
  const DataEntry({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text('Date Entry'),
      ),
      body: ListView(
        padding: const EdgeInsets.only(left: 10, right: 10),
        children: [
          const SizedBox(
            height: 50,
          ),
          CustomTextFields('City Name', TextEditingConto.Name),
          const SizedBox(
            height: 20,
          ),
          CustomTextFields('University Name', TextEditingConto.id),
          const SizedBox(
            height: 20,
          ),
          CustomTextFields('classes', TextEditingConto.classno),
          const SizedBox(
            height: 20,
          ),
          CustomTextFields('Address', TextEditingConto.Adrees),
          const SizedBox(
            height: 10,
          ),
          BlocBuilder<AdddatacubitCubit, AdddatacubitState>(
            builder: (context, state) {
              return InkWell(
                onTap: () async {
                  if (TextEditingConto.vailadation() == true) {
                    context.read<AdddatacubitCubit>().adddata(
                        id: TextEditingConto.Name.text.trim(),
                        context: context);
                    if (state is AddDataLoadingState) {
                      const CircularProgressIndicator();
                    } else if (state is AddDataLoadedState) {
                      Fluttertoast.showToast(msg: 'Complete Data Add');
                    } else if (state is AddDataErrorState) {
                      Fluttertoast.showToast(msg: 'Have Some Error');
                    }
                  } else {
                    Fluttertoast.showToast(
                        msg: 'Please Fill The Fields Correctly');
                  }
                },
                child: Container(
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.red,
                  ),
                  child: const Center(
                    child: Text('Add Data'),
                  ),
                ),
              );
            },
          ),
          MaterialButton(
              color: Colors.red,
              onPressed: () {
                // FetchDataRepo.fetchData(
                //     docid: TextEditingConto.id.text.toString());
              })
        ],
      ),
    );
  }
}
