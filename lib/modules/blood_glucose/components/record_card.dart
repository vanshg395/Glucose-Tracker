import 'package:flutter/material.dart';
import 'package:glucose_tracker/models/blood_glucose_record.model.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class RecordCard extends StatelessWidget {
  const RecordCard({
    required this.record,
    Key? key,
  }) : super(key: key);

  final BloodGlucoseRecord record;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  DateFormat.yMMMMd().format(
                    DateTime.parse(record.date).toLocal(),
                  ),
                  style: const TextStyle(
                    fontSize: 10,
                  ),
                ),
                Text(
                  record.type,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const Spacer(),
                Text(
                  'Notes: ${record.notes}',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 16),
          Text(
            record.bloodSugarLevel.toString(),
            style: GoogleFonts.anton(
              fontSize: 18,
              color: Colors.teal,
              letterSpacing: 1,
            ),
          ),
        ],
      ),
    );
  }
}
