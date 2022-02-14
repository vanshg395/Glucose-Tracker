import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceService {
  late SharedPreferences _prefs;

  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  Future<void> setAccessToken(String accessToken) async {
    await _prefs.setString('accessToken', 'Bearer $accessToken');
  }

  String? get accessToken => _prefs.getString('accessToken');
}

SharedPreferenceService sharedPreferenceService = SharedPreferenceService();
