import 'package:app_dev/page/job/widgets/job_card.dart';
import 'package:flutter/material.dart';

class JobPage extends StatelessWidget {
  const JobPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          JobCard(),
          JobCard(),
          JobCard(),
          JobCard(),
          JobCard(),
          JobCard(),
          JobCard(),
        ],
      ),
    );
  }
}
