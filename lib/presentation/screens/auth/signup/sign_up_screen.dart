import 'package:flutter/material.dart';
import 'package:notes_app_with_php/core/constants/strings.dart';
import 'package:notes_app_with_php/presentation/widgets/text_form_fields/custom_text_form_field.dart';

import '../../../widgets/buttons/custom_auth_button.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);

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
              const CustomTextFormField(
                  hint: "email address", icon: Icons.email),
              const CustomTextFormField(hint: "user name", icon: Icons.person),
              const CustomTextFormField(hint: "password", icon: Icons.lock),
              const SizedBox(
                height: 20,
              ),
              CustomAuthButton(
                text: "Sign Up",
                onPressed: () {
                  if (formKey.currentState!.validate()) {}
                },
              ),
              const SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushReplacementNamed(context, AppRoutes.signInScreenRoute);
                },
                child: const Text(
                  "Already have an Account ?",
                  style: TextStyle(
                    color: Colors.deepPurple,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
