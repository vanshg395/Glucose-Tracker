import 'package:flutter/material.dart';

import 'package:glucose_tracker/blocs/blood_glucose.bloc.dart';

class BloodGlucoseScreen extends StatefulWidget {
  const BloodGlucoseScreen({Key? key}) : super(key: key);

  @override
  State<BloodGlucoseScreen> createState() => _BloodGlucoseScreenState();
}

class _BloodGlucoseScreenState extends State<BloodGlucoseScreen> {
  late BloodGlucoseBloc _bloodGlucoseBloc;

  @override
  void initState() {
    _bloodGlucoseBloc = BloodGlucoseBloc();
    _bloodGlucoseBloc.getRecords();
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
