import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:notes_app_with_php/data/models/auth/sign_up_model.dart';
import 'package:notes_app_with_php/data/repository/note_repository.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this.repository) : super(AuthInitial());

  final NoteRepository repository;

  Future<void> signUp(SignUpModel signupModel) async {
    emit(AuthSignUpLoadingState());
    final result = await repository.signUp(signupModel);
    result.fold(
      (failure) {
        emit(AuthSignUpErrorState(failure.message));
      },
      (successVoid) {
        emit(AuthSignUpSuccessState());
      },
    );
  }
}
