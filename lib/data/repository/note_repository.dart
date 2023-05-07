import 'package:dartz/dartz.dart';
import 'package:notes_app_with_php/core/error_handling/failures/remote_failures.dart';
import 'package:notes_app_with_php/data/data_sources/remote/api_services.dart';
import 'package:notes_app_with_php/data/models/auth/sign_in_model.dart';
import 'package:notes_app_with_php/data/models/auth/sign_up_model.dart';

import '../../core/error_handling/exceptions/remote_exceptions.dart';

class NoteRepository {
  final BaseApiServices apiServices;

  NoteRepository(this.apiServices);

  Future<Either<Failure , void>> signUp(SignUpModel signUpModel) async {
    try {
      return Right(await apiServices.signUp(signUpModel));
    }on NoInternetException catch(e){
      return Left(NoInternetFailure(e.message));
    }on DataParsingException catch(e){
      return Left(DataParsingFailure(e.message));
    }on ServerException catch(e){
      return Left(ServerFailure(e.message));
    }on ClientException catch(e){
      return Left(ClientFailure(e.message));
    }on ResponseException catch(e){
      return Left(ResponseFailure(e.message));
    }on TimeOutCustomException catch(e){
      return Left(TimeOutFailure(e.message));
    }
  }

  Future<Either<Failure , void>> login(SignInModel signInModel) async {
    try {
      return Right(await apiServices.login(signInModel));
    }on NoInternetException catch(e){
      return Left(NoInternetFailure(e.message));
    }on DataParsingException catch(e){
      return Left(DataParsingFailure(e.message));
    }on ServerException catch(e){
      return Left(ServerFailure(e.message));
    }on ClientException catch(e){
      return Left(ClientFailure(e.message));
    }on ResponseException catch(e){
      return Left(ResponseFailure(e.message));
    }on TimeOutCustomException catch(e){
      return Left(TimeOutFailure(e.message));
    }

  }
}