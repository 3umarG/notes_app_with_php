import 'package:notes_app_with_php/data/models/auth/sign_in_model.dart';

class SignUpModel extends SignInModel {
  final String userName;

  SignUpModel({
    required this.userName,
    required super.email,
    required super.password,
  });
}
