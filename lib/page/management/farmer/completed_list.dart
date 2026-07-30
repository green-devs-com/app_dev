import 'package:app_dev/page/management/widgets/applicant_card.dart';
import 'package:flutter/material.dart';

class CompletedList extends StatefulWidget {
  const CompletedList({super.key});

  @override
  State<CompletedList> createState() => _CompletedListState();
}

class _CompletedListState extends State<CompletedList> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.only(top: 10, bottom: 20),
        child: Column(
          children: [
            ApplicantCard(),
            ApplicantCard(),
            ApplicantCard(),
            ApplicantCard(),
            ApplicantCard(),
            ApplicantCard(),
            ApplicantCard(),
          ],
        ),
      ),
    );
  }
}
