import 'package:ecommarce_project/controler/controlers/cubits/verify_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../controler/controlers/firbase_repo/phone_athunti.dart';

class LoginWithPhone extends StatefulWidget {
  const LoginWithPhone({Key? key}) : super(key: key);

  @override
  State<LoginWithPhone> createState() => _LoginWithPhoneState();
}

TextEditingController phone = TextEditingController();

class _LoginWithPhoneState extends State<LoginWithPhone> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => VerifyCubit(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Login With Phone'),
          centerTitle: true,
        ),
        body: ListView(
          padding: const EdgeInsets.only(left: 10, right: 10),
          children: [
            const SizedBox(
              height: 50,
            ),
            SizedBox(
              height: 50,
              child: TextFormField(
                controller: phone,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                    hintText: '+92 39923945',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    label: const Text('+92 phone')),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            BlocBuilder<VerifyCubit, VerifyState>(
              builder: (context, state) {
                print(">>>>>>>>>>>>$state");
                if (state is VerifyLoading) {
                  return const CircularProgressIndicator();
                } else {
                  return MaterialButton(
                    onPressed: () async {
                      // first that method for verification number to verify the number send otp
                      context
                          .read<VerifyCubit>()
                          .verify(context: context, phone: '+92 ${phone.text}');
                    },
                    height: 40,
                    color: Colors.red,
                    child: const Center(
                      child: Text(
                        'Login',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
