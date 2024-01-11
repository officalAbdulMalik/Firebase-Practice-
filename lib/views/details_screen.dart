import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommarce_project/controler/controlers/cubits/fetch_data_cubit.dart';
import 'package:ecommarce_project/views/universty.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../controler/controlers/cubits/update_cubit.dart';

class DrtailScreen extends StatefulWidget {
  const DrtailScreen({Key? key}) : super(key: key);

  @override
  State<DrtailScreen> createState() => _DrtailScreenState();
}

class _DrtailScreenState extends State<DrtailScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider(
        create: (context) => UpdateCubit(),
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Details Screen'),
          ),
          body: BlocBuilder<FetchDataCubit, FetchDataState>(
              builder: (context, state) {
            if (state is FetchLoading) {
              return const CircularProgressIndicator();
            } else if (state is FetchLoaded) {
              return ListView(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height,
                    width: 500,
                    child: ListView.builder(
                      itemCount: state.model.length,
                      itemBuilder: (BuildContext context, int index) {
                        return SizedBox(
                            height: 80,
                            child: InkWell(
                              onTap: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return Universty(
                                    id: state.model[index].id.toString(),
                                  );
                                }));
                              },
                              child: Card(
                                elevation: 2.0,
                                child: Center(
                                  child: Text(state.model[index].id.toString()),
                                ),
                              ),
                            ));
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  // BlocBuilder<UpdateCubit, UpdateState>(
                  //   builder: (context, state) {
                  //     return InkWell(
                  //       onTap: () {
                  //         context.read<UpdateCubit>().update();
                  //         if (state is UpdateLoading) {
                  //           const CircularProgressIndicator();
                  //         } else if (state is UpdateLoaded) {
                  //           Fluttertoast.showToast(msg: 'Complete');
                  //         } else if (state is UpdateError) {
                  //           Fluttertoast.showToast(msg: 'Have Some Error');
                  //         } else {}
                  //       },
                  //       child: Container(
                  //         margin:
                  //             const EdgeInsets.only(left: 39, right: 30),
                  //         height: 50,
                  //         width: 100,
                  //         decoration: BoxDecoration(
                  //           borderRadius: BorderRadius.circular(20),
                  //           color: Colors.red,
                  //         ),
                  //         child: const Center(
                  //           child: Text('Update'),
                  //         ),
                  //       ),
                  //     );
                  //   },
                  // ),
                ],
              );
            } else {
              return Text('error');
            }
          }),
        ),
      ),
    );
  }
}
