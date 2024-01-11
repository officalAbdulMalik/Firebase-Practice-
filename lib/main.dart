import 'package:ecommarce_project/controler/controlers/cubits/athuntication_cubit.dart';
import 'package:ecommarce_project/controler/controlers/cubits/fetch_data_cubit.dart';
import 'package:ecommarce_project/controler/controlers/cubits/update_cubit.dart';
import 'package:ecommarce_project/views/Sign_up_screen.dart';
import 'package:ecommarce_project/views/data_entry.dart';
import 'package:ecommarce_project/views/details_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'controler/controlers/cubits/adddatacubit_cubit.dart';
import 'controler/controlers/cubits/phone_login_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(
        create: (context) => AthunticationCubit(),
      ),
      BlocProvider(
        create: (context) => AdddatacubitCubit(),
      ),
      BlocProvider<FetchDataCubit>(
        create: (context) => FetchDataCubit(),
      ),
      BlocProvider<UpdateCubit>(
        create: (context) => UpdateCubit(),
      ),
    ], child: const MaterialApp(home: DataEntry()));
  }
}
