import 'package:flutter/material.dart';

class AddRecordScreen extends StatelessWidget {
  const AddRecordScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Add Blood Glucose Record',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        titleSpacing: 0,
        backgroundColor: Colors.teal,
      ),
      body: Container(),
    );
  }
}
