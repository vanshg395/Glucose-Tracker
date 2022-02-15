import 'dart:async';

import 'package:flutter/material.dart';
import 'package:glucose_tracker/blocs/auth.bloc.dart';
import 'package:glucose_tracker/routes.dart';
import 'package:passcode_screen/circle.dart';
import 'package:passcode_screen/keyboard.dart';
import 'package:passcode_screen/passcode_screen.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  final StreamController<bool> _verificationNotifier =
      StreamController<bool>.broadcast();

  Future<void> login(String passcode) async {
    bool loginStatus = await authBloc.login(
      passcode: int.parse(passcode),
    );
    if (loginStatus) {
      _verificationNotifier.add(true);
    } else {
      _verificationNotifier.add(false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return PasscodeScreen(
      backgroundColor: Colors.white,
      title: const Text('Enter Passcode'),
      passwordDigits: 4,
      shouldTriggerVerification: _verificationNotifier.stream,
      keyboardUIConfig: const KeyboardUIConfig(
        primaryColor: Colors.black,
        digitFillColor: Colors.black,
      ),
      circleUIConfig: const CircleUIConfig(
        borderColor: Colors.black,
        fillColor: Colors.black,
      ),
      cancelButton: const SizedBox.shrink(),
      deleteButton: const Text(
        'Delete',
        style: TextStyle(
          fontSize: 16,
          color: Colors.black,
        ),
        semanticsLabel: 'Delete',
      ),
      passwordEnteredCallback: login,
      isValidCallback: () {
        Navigator.of(context).pushReplacementNamed(
          Routes.home,
        );
      },
    );
  }
}
