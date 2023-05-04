import 'package:get_it/get_it.dart';
import 'package:notes_app_with_php/business/auth/auth_cubit.dart';
import 'package:notes_app_with_php/data/data_sources/remote/api_services.dart';
import 'package:notes_app_with_php/data/repository/note_repository.dart';

final sl = GetIt.instance;

class ServicesLocator {
  void init() {
    /// Data Source
    sl.registerLazySingleton<BaseApiServices>(() => ApiServices());

    /// Repository
    sl.registerLazySingleton<NoteRepository>(() => NoteRepository(sl()));

    sl.registerLazySingleton<AuthCubit>(() => AuthCubit(sl()));
  }
}
