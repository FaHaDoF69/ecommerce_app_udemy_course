import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/networking/api_endpoints.dart';
import 'package:ecommerce_app/core/networking/dio_helper.dart';
import 'package:ecommerce_app/features/auth/models/login_response_model.dart';

class AuthRepo {
  Future<Either<String, LoginResponseModel>> login(
      String username, String password) async {
    try {
      final response = await DioHelper.postRequest(
        endPoint: ApiEndpoints.login,
        data: {
          "username": username,
          "password": password,
        },
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        LoginResponseModel loginResponseModel =
            LoginResponseModel.fromJson(response.data);

        return Right(loginResponseModel);
      } else {
        return Left(response.toString());
      }
    } catch (error) {
      if (error is DioException) {
        return Left(error.response.toString());
      }

      return Left(error.toString());
    }
  }
}
