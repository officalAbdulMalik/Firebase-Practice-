import 'package:ecommarce_project/controler/controlers/cubits/phone_login_cubit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';

import '../controler/controlers/firbase_repo/phone_athunti.dart';
import 'data_entry.dart';

class VerifyOtp extends StatefulWidget {
  const VerifyOtp({super.key});

  @override
  State<VerifyOtp> createState() => _VerifyOtpState();
}

FirebaseAuth _auth = FirebaseAuth.instance;
final _code = OtpFieldController();
String sms = '';

class _VerifyOtpState extends State<VerifyOtp> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<PhoneLoginCubit>(
      create: (context) => PhoneLoginCubit(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Verify Your number'),
          centerTitle: true,
          automaticallyImplyLeading: false,
        ),
        body: ListView(
          children: [
            const SizedBox(
              height: 50,
            ),
            const Align(
                alignment: Alignment.center,
                child: Text(
                  'Enter Your Otp',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                  ),
                )),
            const SizedBox(
              height: 20,
            ),
            OTPTextField(
              controller: _code,
              outlineBorderRadius: 10,
              margin: const EdgeInsets.only(left: 15, right: 15, top: 10),
              length: 6,
              fieldStyle: FieldStyle.box,
              onChanged: (val) {},
              onCompleted: (val) {
                setState(() {
                  sms = val;
                });
              },
            ),
            const SizedBox(
              height: 40,
            ),
            BlocBuilder<PhoneLoginCubit, PhoneLoginState>(
                builder: (context, state) {
              if (state is PhoneLoginLoading) {
                return const CircularProgressIndicator();
              } else if (state is PhoneLoginLoaded) {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const DataEntry();
                }));
                return const SizedBox();
              } else {
                return Container(
                  margin: const EdgeInsets.only(left: 20, right: 20),
                  child: MaterialButton(
                    onPressed: () async {
                      context.read<PhoneLoginCubit>().phoneLogin();
                    },
                    height: 40,
                    color: Colors.blue,
                    child: const Center(
                      child: Text(
                        'Verify',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                );
              }
            })
          ],
        ),
      ),
    );
  }
}
