import 'dart:convert';

import 'package:glucose_tracker/models/blood_glucose_record.model.dart';

class BloodGlucoseResponse {
  List<BloodGlucoseRecord> records;
  int totalRecord;
  int totalPages;

  BloodGlucoseResponse({
    required this.records,
    required this.totalRecord,
    required this.totalPages,
  });

  BloodGlucoseResponse copyWith({
    List<BloodGlucoseRecord>? records,
    int? totalRecord,
    int? totalPages,
  }) {
    return BloodGlucoseResponse(
      records: records ?? this.records,
      totalRecord: totalRecord ?? this.totalRecord,
      totalPages: totalPages ?? this.totalPages,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'records': records.map((x) => x.toMap()).toList(),
      'totalRecord': totalRecord,
      'totalPages': totalPages,
    };
  }

  factory BloodGlucoseResponse.fromMap(Map<String, dynamic> map) {
    return BloodGlucoseResponse(
      records: List<BloodGlucoseRecord>.from(
          map['records']?.map((x) => BloodGlucoseRecord.fromMap(x))),
      totalRecord: map['totalRecord']?.toInt() ?? 0,
      totalPages: map['totalPages']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory BloodGlucoseResponse.fromJson(String source) =>
      BloodGlucoseResponse.fromMap(json.decode(source));
}
