import 'package:flutter/material.dart';

import '../../../../core/constants/strings.dart';
import '../../../widgets/buttons/custom_auth_button.dart';
import '../../../widgets/text_form_fields/custom_text_form_field.dart';

class SignInScreen extends StatelessWidget {
   SignInScreen({Key? key}) : super(key: key);
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
              const CustomTextFormField(hint: "password", icon: Icons.lock),
              const SizedBox(
                height: 20,
              ),
              CustomAuthButton(
                text: "Sign In",
                onPressed: () {
                  Navigator.pushReplacementNamed(context, AppRoutes.homeScreenRoute);
                },
              ),
              const SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushReplacementNamed(context, AppRoutes.signUpScreenRoute);
                },
                child: const Text(
                  "Don't have an Account ?",
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
