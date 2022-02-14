import 'package:flutter/material.dart';
import 'package:glucose_tracker/modules/auth/login.screen.dart';

import 'package:glucose_tracker/modules/blood_glucose/blood_glucose.screen.dart';

import 'package:glucose_tracker/modules/home.screen.dart';
import 'package:glucose_tracker/modules/meals/meals.screen.dart';

class Routes {
  static const String home = '/';
  static const String login = '/login';
  static const String glucoseRecords = '/glucose-records';
  static const String meals = '/meals';

  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(
          settings: const RouteSettings(name: home),
          builder: (_) => const HomeScreen(),
        );
      case login:
        return MaterialPageRoute(
          settings: const RouteSettings(name: login),
          builder: (_) => const LoginScreen(),
        );
      case glucoseRecords:
        return MaterialPageRoute(
          settings: const RouteSettings(name: glucoseRecords),
          builder: (_) => const BloodGlucoseScreen(),
        );
      case meals:
        return MaterialPageRoute(
          settings: const RouteSettings(name: meals),
          builder: (_) => const MealsScreen(),
        );
      default:
        return null;
    }
  }
}
