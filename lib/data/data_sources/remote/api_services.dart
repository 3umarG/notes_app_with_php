import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:notes_app_with_php/core/constants/api.dart';
import 'package:notes_app_with_php/core/error_handling/exceptions/remote_exceptions.dart';
import 'package:notes_app_with_php/data/models/auth/sign_in_model.dart';
import 'package:notes_app_with_php/data/models/auth/sign_up_model.dart';
import 'package:http/http.dart' as http;

abstract class BaseApiServices {
  Future<void> signUp(SignUpModel signUpModel);

  Future<void> login(SignInModel signInModel);
}

class ApiServices extends BaseApiServices {
  @override
  Future<void> signUp(SignUpModel signUpModel) async {
    try {
      final response = await http.post(
        Uri.parse(ApiConstants.signUpPath),
        body: {
          "user_name": signUpModel.userName,
          "email": signUpModel.email,
          "password": signUpModel.password
        },
      ).timeout(const Duration(seconds: 4));
      // Success
      if (response.statusCode.toString()[0] == "2") {
        final responseBody = jsonDecode(response.body);

        if (responseBody["status"] == "failed") {
          throw ResponseException(responseBody["message"], response.statusCode);
        } else {
          /// Your Request was Successful , do all your stuff here ...
          debugPrint("Your Signup was Successful !!!");
        }
      } else if (response.statusCode.toString()[0] == "4") {
        throw ClientException(
            ApiConstants.clientExceptionMessage, response.statusCode);
      } else if (response.statusCode.toString()[0] == "5") {
        throw ServerException(
            ApiConstants.serverExceptionMessage, response.statusCode);
      }
    } catch (e) {
      if (e is RemoteException ||
          e is ServerException ||
          e is ClientException ||
          e is ResponseException) {
        rethrow;
      } else if (e is TimeoutException) {
        throw TimeOutCustomException(ApiConstants.timeoutExceptionMessage, 0);

      } else {
        throw NoInternetException(ApiConstants.noInternetExceptionMessage, 0);
      }
    }
  }

  @override
  Future<void> login(SignInModel signInModel)async {
    try {
      final response = await http.post(
        Uri.parse(ApiConstants.signInPath),
        body: {
          "email": signInModel.email,
          "password": signInModel.password
        },
      ).timeout(const Duration(seconds: 4));
      // Success
      if (response.statusCode.toString()[0] == "2") {
        final responseBody = jsonDecode(response.body);

        if (responseBody["status"] == "failed") {
          throw ResponseException(responseBody["message"], response.statusCode);
        } else {
          /// Your Request was Successful , do all your stuff here ...
          debugPrint("Your Signup was Successful !!!");
        }
      } else if (response.statusCode.toString()[0] == "4") {
        throw ClientException(
            ApiConstants.clientExceptionMessage, response.statusCode);
      } else if (response.statusCode.toString()[0] == "5") {
        throw ServerException(
            ApiConstants.serverExceptionMessage, response.statusCode);
      }
    } catch (e) {
      if (e is RemoteException ||
          e is ServerException ||
          e is ClientException ||
          e is ResponseException) {
        rethrow;
      } else if (e is TimeoutException) {
        throw TimeOutCustomException(ApiConstants.timeoutExceptionMessage, 0);

      } else {
        throw NoInternetException(ApiConstants.noInternetExceptionMessage, 0);
      }
    }

  }
}