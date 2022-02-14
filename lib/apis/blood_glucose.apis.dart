import 'dart:convert';

import 'package:http/http.dart';

import 'package:glucose_tracker/models/api_state.model.dart';
import 'package:glucose_tracker/models/blood_glucose_record.model.dart';

import 'package:glucose_tracker/services/api_handler.service.dart';

class BloodGlucoseApis {
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
}

BloodGlucoseApis bloodGlucoseApis = BloodGlucoseApis();
