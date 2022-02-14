import 'package:flutter/material.dart';

import 'package:glucose_tracker/blocs/blood_glucose.bloc.dart';

class BloodGlucoseScreen extends StatefulWidget {
  const BloodGlucoseScreen({Key? key}) : super(key: key);

  @override
  State<BloodGlucoseScreen> createState() => _BloodGlucoseScreenState();
}

class _BloodGlucoseScreenState extends State<BloodGlucoseScreen> {
  final BloodGlucoseBloc _bloodGlucoseBloc = BloodGlucoseBloc();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Blood Glucose',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.teal,
      ),
      body: Container(),
    );
  }
}
