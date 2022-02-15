import 'package:rxdart/rxdart.dart';

import 'package:glucose_tracker/apis/blood_glucose.apis.dart';

import 'package:glucose_tracker/models/api_state.model.dart';
import 'package:glucose_tracker/models/blood_glucose_response.model.dart';

import 'package:glucose_tracker/blocs/base.bloc.dart';

class BloodGlucoseBloc extends BaseBloc {
  BehaviorSubject<BloodGlucoseResponse?> bloodGlucoseRecordsController =
      BehaviorSubject<BloodGlucoseResponse?>.seeded(null);
  int _page = 1;

  int get page => _page;

  Future<void> createRecord() async {}

  Future<void> getRecords({bool refresh = false}) async {
    if (refresh) {
      _page = 1;
      bloodGlucoseRecordsController.add(null);
    }
    ApiResponse<BloodGlucoseResponse?> response =
        await bloodGlucoseApis.getRecords(
      page: _page,
    );
    if (response.success) {
      bloodGlucoseRecordsController.add(response.result);
    } else {
      bloodGlucoseRecordsController.addError(response.error!);
    }
  }

  @override
  void dispose() {
    bloodGlucoseRecordsController.close();
  }
}
