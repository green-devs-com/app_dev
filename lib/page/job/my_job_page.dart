import 'package:app_dev/core/theme/custom_theme.dart';
import 'package:app_dev/page/job/widgets/job_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyJobPage extends StatefulWidget {
  final bool isInit;
  const MyJobPage({super.key, this.isInit = false});

  @override
  State<MyJobPage> createState() => _MyJobPageState();
}

class _MyJobPageState extends State<MyJobPage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(
      initialIndex: widget.isInit ? 1 : 0,
      length: 3,
      vsync: this,
    );
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: false,
          title: Text("내 채용공고"),
          leading: IconButton(
            icon: const Icon(CupertinoIcons.chevron_back),
            onPressed: () => Navigator.pop(context),
          ),
          bottom: TabBar(
            controller: tabController,
            indicatorSize: TabBarIndicatorSize.tab,
            dividerHeight: 0.3,
            dividerColor: context.theme.textColor!.withValues(alpha: 0.6),
            physics: NeverScrollableScrollPhysics(),
            splashFactory: NoSplash.splashFactory,
            labelStyle: const TextStyle(fontWeight: FontWeight.bold),
            indicatorColor: context.theme.mainColor,
            labelColor: context.theme.textColor,
            unselectedLabelColor: context.theme.textColor!.withValues(
              alpha: 0.6,
            ),
            tabs: [
              Tab(text: "전체"),
              Tab(text: "모집중"),
              Tab(text: "마감"),
            ],
          ),
        ),
        body: TabBarView(
          controller: tabController,
          physics: NeverScrollableScrollPhysics(),
          children: [
            Column(children: [JobCard(), JobCard(), JobCard(), JobCard()]),
            Center(child: Text("모집중")),
            Center(child: Text("마감")),
          ],
        ),
        floatingActionButton: IconButton(
          onPressed: () {},
          icon: Icon(CupertinoIcons.pencil, size: 30),
          color: Colors.white,
          style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all(context.theme.mainColor),
          ),
        ),
      ),
    );
  }
}
