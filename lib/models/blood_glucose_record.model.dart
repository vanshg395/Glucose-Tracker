import 'dart:convert';

class BloodGlucoseRecord {
  String? id;
  int bloodSugarLevel;
  String date;
  String type;
  String notes;

  BloodGlucoseRecord({
    this.id,
    required this.bloodSugarLevel,
    required this.date,
    required this.type,
    required this.notes,
  });

  BloodGlucoseRecord copyWith({
    String? id,
    int? bloodSugarLevel,
    String? date,
    String? type,
    String? notes,
  }) {
    return BloodGlucoseRecord(
      id: id ?? this.id,
      bloodSugarLevel: bloodSugarLevel ?? this.bloodSugarLevel,
      date: date ?? this.date,
      type: type ?? this.type,
      notes: notes ?? this.notes,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'bloodSugarLevel': bloodSugarLevel,
      'date': date,
      'type': type,
      'notes': notes,
    };
  }

  factory BloodGlucoseRecord.fromMap(Map<String, dynamic> map) {
    return BloodGlucoseRecord(
      id: map['id'],
      bloodSugarLevel: map['bloodSugarLevel']?.toInt() ?? 0,
      date: map['date'] ?? '',
      type: map['type'] ?? '',
      notes: map['notes'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory BloodGlucoseRecord.fromJson(String source) =>
      BloodGlucoseRecord.fromMap(json.decode(source));
}
