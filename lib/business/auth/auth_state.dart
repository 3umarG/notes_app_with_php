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
