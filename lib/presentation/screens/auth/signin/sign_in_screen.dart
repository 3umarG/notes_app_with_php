import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app_with_php/business/auth/auth_cubit.dart';
import 'package:notes_app_with_php/data/models/auth/sign_in_model.dart';

import '../../../../core/constants/strings.dart';
import '../../../widgets/buttons/custom_auth_button.dart';
import '../../../widgets/text_form_fields/custom_text_form_field.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({Key? key}) : super(key: key);
  final formKey = GlobalKey<FormState>();
  final emailCont = TextEditingController();
  final passwordCont = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomTextFormField(
                  controller: emailCont,
                  hint: "email address",
                  icon: Icons.email),
              CustomTextFormField(
                  controller: passwordCont, hint: "password", icon: Icons.lock),
              const SizedBox(
                height: 20,
              ),
              BlocConsumer<AuthCubit, AuthState>(
                listener: (context, state) {
                  if (state is AuthLoginSuccessState) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text("Login Successfully"),
                      backgroundColor: Colors.green,
                    ));
                  } else if (state is AuthLoginErrorState) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(state.message),
                      backgroundColor: Colors.redAccent,
                    ));
                  }
                },
                buildWhen: (oldState, newState) =>
                    oldState is AuthLoginState || newState is AuthLoginState,
                builder: (context, state) {
                  return state is AuthLoginLoadingState
                      ? const Center(
                          child: CircularProgressIndicator(
                            color: Colors.deepPurple,
                          ),
                        )
                      : CustomAuthButton(
                          text: "Sign In",
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              context.read<AuthCubit>().login(SignInModel(
                                    email: emailCont.text,
                                    password: passwordCont.text,
                                  ));
                            }
                          },
                        );
                },
              ),
              const SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushReplacementNamed(
                      context, AppRoutes.signUpScreenRoute);
                },
                child: const Text(
                  "Don't have an Account ?",
                  style: TextStyle(
                      color: Colors.deepPurple, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
