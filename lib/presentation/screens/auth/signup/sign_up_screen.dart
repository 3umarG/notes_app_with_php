import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app_with_php/business/auth/auth_cubit.dart';
import 'package:notes_app_with_php/core/constants/strings.dart';
import 'package:notes_app_with_php/data/models/auth/sign_up_model.dart';
import 'package:notes_app_with_php/presentation/widgets/text_form_fields/custom_text_form_field.dart';

import '../../../widgets/buttons/custom_auth_button.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);

  final emailController = TextEditingController();
  final userNameController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

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
                hint: "email address",
                icon: Icons.email,
                controller: emailController,
              ),
              CustomTextFormField(
                hint: "user name",
                icon: Icons.person,
                controller: userNameController,
              ),
              CustomTextFormField(
                hint: "password",
                icon: Icons.lock,
                controller: passwordController,
              ),
              const SizedBox(
                height: 20,
              ),
              BlocConsumer<AuthCubit, AuthState>(
                listener: (context, state) {
                  if (state is AuthSignUpErrorState) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(state.message),
                      backgroundColor: Colors.redAccent,
                    ));
                  }else if(state is AuthSignUpSuccessState){
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text("You have Signed Up !!!"),
                      backgroundColor: Colors.green,
                    ));
                  }
                },
                builder: (context, state) {
                  return state is AuthSignUpLoadingState
                      ? const Center(
                          child: CircularProgressIndicator(
                            color: Colors.deepPurple,
                          ),
                        )
                      : CustomAuthButton(
                          text: "Sign Up",
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              context.read<AuthCubit>().signUp(SignUpModel(
                                    userName: userNameController.text,
                                    email: emailController.text,
                                    password: passwordController.text,
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
                      context, AppRoutes.signInScreenRoute);
                },
                child: const Text(
                  "Already have an Account ?",
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
