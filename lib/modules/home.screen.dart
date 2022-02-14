import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:glucose_tracker/routes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed(
                  Routes.glucoseRecords,
                );
              },
              child: Container(
                alignment: Alignment.center,
                width: double.infinity,
                color: Colors.teal,
                child: Text(
                  'Blood Glucose',
                  style: TextStyle(
                    fontSize: 36,
                    color: Colors.white,
                    fontFamily: GoogleFonts.anton().fontFamily,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed(
                  Routes.meals,
                );
              },
              child: Container(
                alignment: Alignment.center,
                width: double.infinity,
                color: Colors.orange,
                child: Text(
                  'Meals',
                  style: TextStyle(
                    fontSize: 36,
                    color: Colors.white,
                    fontFamily: GoogleFonts.anton().fontFamily,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
