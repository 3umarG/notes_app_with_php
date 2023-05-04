import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:notes_app_with_php/data/repository/note_repository.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this.repository) : super(AuthInitial());

  final NoteRepository repository;
}
