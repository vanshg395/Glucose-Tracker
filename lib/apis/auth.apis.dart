import 'dart:convert';

import 'package:http/http.dart';

import 'package:glucose_tracker/services/api_handler.service.dart';

import 'package:glucose_tracker/models/login_response.model.dart';
import 'package:glucose_tracker/models/api_state.model.dart';

class AuthApis {
  Future<ApiResponse<LoginResponse?>> login({
    required int passcode,
  }) async {
    try {
      final Response response = await ApiHandlerService.post(
        endpoint: '/auth',
        body: {
          "code": passcode,
        },
      );
      final Map<String, dynamic> resBody = json.decode(response.body);
      switch (response.statusCode) {
        case 200:
          return ApiResponse<LoginResponse?>.success(
            LoginResponse.fromMap(resBody['data']),
          );
        default:
          return ApiResponse<LoginResponse?>.error(
            Error.apiError(resBody['message']),
          );
      }
    } catch (e) {
      print(e);
      return ApiResponse<LoginResponse?>.error(
        Error.apiError('Something Went Wrong'),
      );
    }
  }
}

AuthApis authApis = AuthApis();
