import 'dart:convert';

import 'package:glucose_tracker/models/blood_glucose_response.model.dart';
import 'package:glucose_tracker/models/filter.model.dart';
import 'package:http/http.dart';

import 'package:glucose_tracker/models/api_state.model.dart';
import 'package:glucose_tracker/models/blood_glucose_record.model.dart';

import 'package:glucose_tracker/services/api_handler.service.dart';

class BloodGlucoseApis {
  int _page = 1;

  Future<ApiResponse<BloodGlucoseRecord?>> createRecord(
      {required BloodGlucoseRecord bloodGlucoseDetails}) async {
    try {
      final Response response = await ApiHandlerService.post(
        endpoint: '/bloodSugarRecords',
        body: bloodGlucoseDetails.toMap(),
      );
      final Map<String, dynamic> resBody = json.decode(response.body);
      switch (response.statusCode) {
        case 201:
          return ApiResponse<BloodGlucoseRecord?>.success(
            BloodGlucoseRecord.fromMap(resBody['data']['record']),
          );
        default:
          return ApiResponse<BloodGlucoseRecord?>.error(
            Error.apiError(resBody['message']),
          );
      }
    } catch (e) {
      return ApiResponse<BloodGlucoseRecord?>.error(
        Error.apiError('Something Went Wrong'),
      );
    }
  }

  Future<ApiResponse<BloodGlucoseResponse?>> getRecords({
    required int page,
    Filter? filters,
  }) async {
    try {
      String endpoint = '/bloodSugarRecords?';
      String queryParams = Uri(
        queryParameters: {
          if (filters != null) ...filters.toMap(),
          'page': page.toString(),
        },
      ).query;
      final Response response = await ApiHandlerService.get(
        endpoint: endpoint + queryParams,
      );
      final Map<String, dynamic> resBody = json.decode(response.body);
      switch (response.statusCode) {
        case 200:
          return ApiResponse<BloodGlucoseResponse?>.success(
            BloodGlucoseResponse.fromMap(resBody['data']),
          );
        default:
          return ApiResponse<BloodGlucoseResponse?>.error(
            Error.apiError(resBody['message']),
          );
      }
    } catch (e) {
      print(e);
      return ApiResponse<BloodGlucoseResponse?>.error(
        Error.apiError('Something Went Wrong'),
      );
    }
  }
}

BloodGlucoseApis bloodGlucoseApis = BloodGlucoseApis();
