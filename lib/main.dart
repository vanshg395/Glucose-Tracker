import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:glucose_tracker/routes.dart';

import 'package:glucose_tracker/services/shared_prefernces.service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await sharedPreferenceService.init();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Glucose Tracker',
      initialRoute: sharedPreferenceService.accessToken != null
          ? Routes.home
          : Routes.login,
      onGenerateRoute: Routes.generateRoute,
    );
  }
}
