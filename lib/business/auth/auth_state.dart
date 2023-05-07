part of 'auth_cubit.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}

abstract class AuthSignUpState extends AuthState{}
class AuthSignUpLoadingState extends AuthSignUpState{}
class AuthSignUpSuccessState extends AuthSignUpState{}
class AuthSignUpErrorState extends AuthSignUpState{
  final String message;
  AuthSignUpErrorState(this.message);
}

abstract class AuthLoginState extends AuthState{}
class AuthLoginLoadingState extends AuthLoginState{}
class AuthLoginSuccessState extends AuthLoginState{}
class AuthLoginErrorState extends AuthLoginState{
  final String message;
  AuthLoginErrorState(this.message);
}
