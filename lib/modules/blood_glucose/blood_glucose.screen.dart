import 'package:flutter/material.dart';

import 'package:glucose_tracker/blocs/blood_glucose.bloc.dart';

import 'package:glucose_tracker/models/blood_glucose_response.model.dart';
import 'package:glucose_tracker/modules/blood_glucose/components/record_card.dart';
import 'package:glucose_tracker/routes.dart';
import 'package:lazy_loading_list/lazy_loading_list.dart';

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
    _bloodGlucoseBloc.getRecords(refresh: true);
    super.initState();
  }

  Widget buildRecordList(BloodGlucoseResponse data) {
    return ListView.separated(
      itemBuilder: (BuildContext ctx, int i) => LazyLoadingList(
        loadMore: _bloodGlucoseBloc.getRecords,
        child: RecordCard(
          record: data.records[i],
        ),
        index: i,
        hasMore: _bloodGlucoseBloc.page < data.totalPages,
      ),
      separatorBuilder: (BuildContext ctx, int i) => const Divider(
        thickness: 1,
      ),
      itemCount: data.records.length,
    );
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
        titleSpacing: 0,
        backgroundColor: Colors.teal,
      ),
      body: StreamBuilder<BloodGlucoseResponse?>(
        stream: _bloodGlucoseBloc.bloodGlucoseRecordsController.stream,
        builder: (BuildContext context,
            AsyncSnapshot<BloodGlucoseResponse?> snapshot) {
          if (snapshot.hasError) {
            return const Center(
              child: Text(
                'Something Went Wrong',
              ),
            );
          } else if (snapshot.hasData) {
            return buildRecordList(snapshot.data!);
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
      bottomNavigationBar: GestureDetector(
        onTap: () {
          Navigator.of(context).pushNamed(
            Routes.addGlucoseRecord,
          );
        },
        child: Container(
          alignment: Alignment.center,
          height: 60,
          color: Colors.teal,
          child: const Text(
            'ADD RECORD',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
