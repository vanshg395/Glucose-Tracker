import 'dart:convert';

class Filter {
  String? type;
  String? startingDate;
  String? endingDate;
  String? sortBy;
  String? sortOrder;

  Filter({
    this.type,
    this.startingDate,
    this.endingDate,
    this.sortBy,
    this.sortOrder,
  });

  Filter copyWith({
    String? type,
    String? startingDate,
    String? endingDate,
    String? sortBy,
    String? sortOrder,
  }) {
    return Filter(
      type: type ?? this.type,
      startingDate: startingDate ?? this.startingDate,
      endingDate: endingDate ?? this.endingDate,
      sortBy: sortBy ?? this.sortBy,
      sortOrder: sortOrder ?? this.sortOrder,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'type': type,
      'startingDate': startingDate,
      'endingDate': endingDate,
      'sortBy': sortBy,
      'sortOrder': sortOrder,
    };
  }

  factory Filter.fromMap(Map<String, dynamic> map) {
    return Filter(
      type: map['type'],
      startingDate: map['startingDate'],
      endingDate: map['endingDate'],
      sortBy: map['sortBy'],
      sortOrder: map['sortOrder'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Filter.fromJson(String source) => Filter.fromMap(json.decode(source));
}
