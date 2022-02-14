import 'dart:convert';

import 'package:http/http.dart';

import 'package:glucose_tracker/services/api_handler.service.dart';

import 'package:glucose_tracker/models/login_response.model.dart';
import 'package:glucose_tracker/models/login_credential.model.dart';
import 'package:glucose_tracker/models/api_state.model.dart';

class AuthApis {
  Future<ApiResponse<LoginResponse?>> login(
      {required LoginCredential credentials}) async {
    try {
      final Response response = await ApiHandlerService.post(
        endpoint: '/login',
        body: credentials.toMap(),
      );
      final Map<String, dynamic> resBody = json.decode(response.body);
      switch (response.statusCode) {
        case 200:
        // return ApiResponse<LoginResponse?>.success(
        //   BloodGlucoseRecord.fromMap(resBody['data']['record']),
        // );
        default:
          return ApiResponse<LoginResponse?>.error(
            Error.apiError(resBody['message']),
          );
      }
    } catch (e) {
      return ApiResponse<LoginResponse?>.error(
        Error.apiError('Something Went Wrong'),
      );
    }
  }
}

AuthApis authApis = AuthApis();
