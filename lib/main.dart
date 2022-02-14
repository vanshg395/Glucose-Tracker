import 'package:flutter/material.dart';

import 'package:glucose_tracker/routes.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Glucose Tracker',
      initialRoute: Routes.home,
      onGenerateRoute: Routes.generateRoute,
    );
  }
}
