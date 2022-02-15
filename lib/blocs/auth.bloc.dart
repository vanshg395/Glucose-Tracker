import 'package:glucose_tracker/apis/auth.apis.dart';
import 'package:glucose_tracker/blocs/base.bloc.dart';
import 'package:glucose_tracker/models/api_state.model.dart';
import 'package:glucose_tracker/models/login_response.model.dart';
import 'package:glucose_tracker/services/shared_prefernces.service.dart';

class AuthBloc with BaseBloc {
  Future<bool> login({required int passcode}) async {
    ApiResponse<LoginResponse?> response = await authApis.login(
      passcode: passcode,
    );
    if (response.success) {
      sharedPreferenceService.setAccessToken(response.result!.token);
      return true;
    } else {
      return false;
    }
  }

  @override
  void dispose() {}
}

AuthBloc authBloc = AuthBloc();
