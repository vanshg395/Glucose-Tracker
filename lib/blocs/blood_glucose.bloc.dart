import 'package:rxdart/rxdart.dart';

import 'package:glucose_tracker/apis/blood_glucose.apis.dart';

import 'package:glucose_tracker/models/blood_glucose_record.model.dart';

import 'package:glucose_tracker/blocs/base.bloc.dart';

class BloodGlucoseBloc extends BaseBloc {
  BehaviorSubject<List<BloodGlucoseRecord>?> bloodGlucoseRecordsController =
      BehaviorSubject<List<BloodGlucoseRecord>?>.seeded(null);

  Future<void> createRecord() async {}
  @override
  void dispose() {
    bloodGlucoseRecordsController.close();
  }
}
