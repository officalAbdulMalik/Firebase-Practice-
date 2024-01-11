import 'package:ecommarce_project/controler/controlers/cubits/athuntication_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../controler/controlers/firbase_repo/google_signin.dart';
import '../controler/controlers/text_editing_controler.dart';
import '../utils/app_static_prop/static_text_fields.dart';
import 'login_with_phone.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

final GlobalKey<FormState> formKey = GlobalKey<FormState>();

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Sign Up',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: Form(
        key: formKey,
        child: ListView(
          padding: const EdgeInsets.only(left: 10, right: 10),
          children: [
            const SizedBox(
              height: 50,
            ),
            CustomTextFields('Name', TextEditingConto.name),
            const SizedBox(
              height: 20,
            ),
            CustomTextFields('Email', TextEditingConto.email),
            const SizedBox(
              height: 20,
            ),
            CustomTextFields('Password', TextEditingConto.pass),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Expanded(
                    child: InkWell(
                  onTap: () async {
                    GoogleSignin.signInWithGoogle();
                  },
                  child: Container(
                    margin: const EdgeInsets.only(left: 5, right: 5),
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.blue,
                    ),
                    child: const Center(
                      child: Text(
                        ' Google Login',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                )),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return const LoginWithPhone();
                      }));
                    },
                    child: Container(
                      margin: const EdgeInsets.only(left: 5, right: 5),
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.yellow,
                      ),
                      child: const Center(
                        child: Text(
                          'Other Account',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            InkWell(
              onTap: () async {
                if (formKey.currentState!.validate()) {
                  context.read<AthunticationCubit>().athuntic(
                        email: TextEditingConto.email.text.trim(),
                        pass: TextEditingConto.pass.text.trim(),
                      );
                }
              },
              child: Container(
                margin: const EdgeInsets.only(left: 5, right: 5),
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.red,
                ),
                child: Center(
                  child: BlocBuilder<AthunticationCubit, AthunticationState>(
                    builder: (context, state) {
                      if (state is AthunticationLoading) {
                        return const CircularProgressIndicator();
                      } else {
                        return const Text(
                          ' Login With Email',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                          ),
                        );
                      }
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
