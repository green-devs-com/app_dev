import 'package:app_dev/page/management/widgets/applicant_card.dart';
import 'package:flutter/material.dart';

class ApplicantsList extends StatefulWidget {
  const ApplicantsList({super.key});

  @override
  State<ApplicantsList> createState() => _ApplicantsListState();
}

class _ApplicantsListState extends State<ApplicantsList> {
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
          ],
        ),
      ),
    );
  }
}
