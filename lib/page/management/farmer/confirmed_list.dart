import 'package:app_dev/page/management/widgets/applicant_card.dart';
import 'package:flutter/material.dart';

class ConfirmedList extends StatefulWidget {
  const ConfirmedList({super.key});

  @override
  State<ConfirmedList> createState() => _ConfirmedListState();
}

class _ConfirmedListState extends State<ConfirmedList> {
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
